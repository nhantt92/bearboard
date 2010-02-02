/**
  ******************************************************************************
  * @file    FLASH/Write_Protection/main.c 
  * @author  MCD Application Team
  * @version V3.1.2
  * @date    09/28/2009
  * @brief   Main program body
  ******************************************************************************
  * @copy
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  */ 

/* Includes ------------------------------------------------------------------*/
#include "stm32f10x.h"

/** @addtogroup STM32F10x_StdPeriph_Examples
  * @{
  */

/** @addtogroup FLASH_Write_Protection
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;

/* Private define ------------------------------------------------------------*/
/* Define the STM32F10x FLASH Page Size depending on the used STM32 device */
#ifdef STM32F10X_LD
  #define FLASH_PAGE_SIZE    ((uint16_t)0x400)
#elif defined STM32F10X_MD
  #define FLASH_PAGE_SIZE    ((uint16_t)0x400)
#elif defined STM32F10X_HD
  #define FLASH_PAGE_SIZE    ((uint16_t)0x800)
#elif defined STM32F10X_CL
  #define FLASH_PAGE_SIZE    ((uint16_t)0x800)  
#endif /* STM32F10X_LD */

#define StartAddr  ((uint32_t)0x08006000)
#define EndAddr    ((uint32_t)0x08008000)
 
/* Uncomment this line to Enable Write Protection */
//#define WriteProtection_Enable
/* Uncomment this line to Disable Write Protection */
#define WriteProtection_Disable

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/  
uint32_t EraseCounter, Address;
uint16_t Data;
__IO uint32_t WRPR_Value = 0xFFFFFFFF, ProtectedPages = 0x0;
__IO uint8_t NbrOfPage;
volatile FLASH_Status FLASHStatus;
volatile TestStatus MemoryProgramStatus;

/* Private function prototypes -----------------------------------------------*/
void RCC_Configuration(void);
    
/* Private functions ---------------------------------------------------------*/

/**
  * @brief   Main program
  * @param  None
  * @retval None
  */
int main(void)
{
  FLASHStatus = FLASH_COMPLETE;
  MemoryProgramStatus = PASSED;  
  Data = 0x1753;
  EraseCounter = 0x0;
  
  /* RCC Configuration */
  RCC_Configuration();  
  
  /* Unlock the Flash Program Erase controller */  
  FLASH_Unlock();

  /* Define the number of page to be erased */
  NbrOfPage = (EndAddr - StartAddr) / FLASH_PAGE_SIZE;
  
  FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP|FLASH_FLAG_PGERR |FLASH_FLAG_WRPRTERR);

  /* Get pages write protection status */
  WRPR_Value = FLASH_GetWriteProtectionOptionByte();
  ProtectedPages = WRPR_Value & 0x000000C0;

#ifdef WriteProtection_Disable
  if (ProtectedPages == 0x00)
  {/* Pages are write protected */

    /* Disable the write protection */
    FLASHStatus = FLASH_EraseOptionBytes();

    /* Generate System Reset to load the new option byte values */
    NVIC_SystemReset();
  }
#elif defined WriteProtection_Enable
  
  if (ProtectedPages != 0x00)
  {
    /* Pages not write protected */
    #if defined (STM32F10X_LD) || defined (STM32F10X_MD)
      /* Enable the pages write protection */
      FLASHStatus = FLASH_EnableWriteProtection(FLASH_WRProt_Pages24to27 |FLASH_WRProt_Pages28to31);    
    
    #else /* (STM32F10X_HD) || defined (STM32F10X_CL) */  
      /* Enable the pages write protection */
      FLASHStatus = FLASH_EnableWriteProtection(FLASH_WRProt_Pages12to13 |FLASH_WRProt_Pages14to15);
    #endif
    
    /* Generate System Reset to load the new option byte values */
    NVIC_SystemReset();
  }
#endif
  
  /* If Pages are not write protected, perform erase and program operations
     Else nothing */
  if (ProtectedPages != 0x00)
  {
    /* Clear All pending flags */
    FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP|FLASH_FLAG_PGERR |FLASH_FLAG_WRPRTERR);	

    /* erase the FLASH pages */
    for(EraseCounter = 0; (EraseCounter < NbrOfPage) && (FLASHStatus == FLASH_COMPLETE); EraseCounter++)
    {
      FLASHStatus = FLASH_ErasePage(StartAddr + (FLASH_PAGE_SIZE * EraseCounter));
    }
  
    /* FLASH Half Word program of data 0x1753 at addresses defined by  StartAddr and EndAddr */
    Address = StartAddr;

    while((Address < EndAddr) && (FLASHStatus == FLASH_COMPLETE))
    {
      FLASHStatus = FLASH_ProgramHalfWord(Address, Data);
      Address = Address + 2;
    }

    /* Check the corectness of written data */
    Address = StartAddr;

    while((Address < EndAddr) && (MemoryProgramStatus != FAILED))
    {
      if((*(__IO uint16_t*) Address) != Data)
      {
        MemoryProgramStatus = FAILED;
      }
      Address += 2;
    }
 
  }

  while (1)
  {
  }
}

/**
  * @brief  Configures the different system clocks.
  * @param  None
  * @retval None
  */
void RCC_Configuration(void)
{   
  /* Setup the microcontroller system. Initialize the Embedded Flash Interface,  
     initialize the PLL and update the SystemFrequency variable. */
  SystemInit();
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  while (1)
  {
  }
}
#endif

/**
  * @}
  */ 

/**
  * @}
  */ 

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
