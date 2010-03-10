EESchema Schematic File Version 2  date Wed 10 Mar 2010 05:32:05 PM EST
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:luminarymicro
LIBS:stm32
LIBS:wiznet
LIBS:dips-s
LIBS:misc
LIBS:usb-b
LIBS:arduinoshield
LIBS:power_supply
LIBS:ftdichip
LIBS:con-usb
LIBS:con-usb-2
LIBS:con-usb-3
LIBS:powerconnectorskt
LIBS:Power-in
LIBS:pswitch40
LIBS:bearboard-cache
EELAYER 24  0
EELAYER END
$Descr A4 11700 8267
Sheet 2 5
Title ""
Date "10 mar 2010"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3500 2750 4350 2750
Wire Wire Line
	6450 4200 6900 4200
Wire Wire Line
	6450 3400 6800 3400
Wire Wire Line
	6450 3200 6800 3200
Wire Wire Line
	5750 2500 4600 2500
Wire Wire Line
	4600 2500 4600 3050
Connection ~ 4350 3150
Wire Wire Line
	4350 2750 4350 3150
Wire Wire Line
	7700 3700 7700 3900
Wire Wire Line
	7700 3900 6450 3900
Wire Wire Line
	7700 2700 7700 2500
Wire Wire Line
	7700 3200 7700 3300
Wire Wire Line
	3050 3600 3200 3600
Wire Wire Line
	3200 3600 3200 3900
Wire Wire Line
	3200 3900 3350 3900
Wire Wire Line
	5550 5000 5550 5350
Connection ~ 5550 5150
Wire Wire Line
	5850 5000 5850 5150
Wire Wire Line
	5850 5150 5250 5150
Wire Wire Line
	5250 5150 5250 5000
Wire Wire Line
	4600 3400 4600 3300
Wire Wire Line
	4600 3300 3050 3300
Wire Wire Line
	3550 3150 3050 3150
Wire Wire Line
	4150 3150 4600 3150
Wire Wire Line
	3050 3450 4500 3450
Wire Wire Line
	4500 3450 4500 3500
Wire Wire Line
	4500 3500 4600 3500
Wire Wire Line
	5400 5000 5400 5150
Connection ~ 5400 5150
Wire Wire Line
	5700 5150 5700 5000
Connection ~ 5700 5150
Wire Wire Line
	3350 3500 3350 3150
Connection ~ 3350 3150
Wire Wire Line
	3350 3900 3350 4100
Wire Wire Line
	4450 4700 4450 4850
Wire Wire Line
	8000 3200 8000 3300
Wire Wire Line
	8000 2700 8000 2500
Wire Wire Line
	8000 3700 8000 4000
Wire Wire Line
	8000 4000 6450 4000
Wire Wire Line
	3750 4300 4600 4300
Connection ~ 4450 4300
Wire Wire Line
	6450 3100 6800 3100
Wire Wire Line
	6450 3300 6800 3300
Wire Wire Line
	6450 4100 6900 4100
Wire Wire Line
	6450 4300 6900 4300
Text GLabel 3500 2750 0    60   Output ~ 0
USBFTDI5V
Text HLabel 6900 4300 2    60   BiDi ~ 0
CBUS4
Text HLabel 6900 4200 2    60   BiDi ~ 0
CBUS3
Text HLabel 6900 4100 2    60   BiDi ~ 0
CBUS2
Text Label 5750 2500 0    60   ~ 0
3V3
Text HLabel 6800 3400 2    60   BiDi ~ 0
CTS
Text HLabel 6800 3300 2    60   BiDi ~ 0
RTS
Text HLabel 6800 3200 2    60   Output ~ 0
RXD
Text HLabel 6800 3100 2    60   Input ~ 0
TXD
NoConn ~ 6450 3800
NoConn ~ 6450 3700
NoConn ~ 6450 3600
NoConn ~ 6450 3500
Text Label 7700 2500 2    60   ~ 0
3V3FTDI
Text Label 8000 2500 0    60   ~ 0
3V3FTDI
Text Label 3750 4300 0    60   ~ 0
3V3FTDI
NoConn ~ 4600 4100
NoConn ~ 4600 4000
NoConn ~ 4600 3800
NoConn ~ 4600 3900
NoConn ~ 4600 3700
Text Label 3600 2750 0    60   ~ 0
5V0FTDI
$Comp
L R R69
U 1 1 4B91C61B
P 8000 2950
F 0 "R69" V 8080 2950 50  0000 C CNN
F 1 "270" V 8000 2950 50  0000 C CNN
	1    8000 2950
	1    0    0    -1  
$EndComp
$Comp
L R R68
U 1 1 4B91C617
P 7700 2950
F 0 "R68" V 7780 2950 50  0000 C CNN
F 1 "270" V 7700 2950 50  0000 C CNN
	1    7700 2950
	1    0    0    -1  
$EndComp
$Comp
L LED D18
U 1 1 4B91C60D
P 8000 3500
F 0 "D18" H 8000 3600 50  0000 C CNN
F 1 "LED" H 8000 3400 50  0000 C CNN
	1    8000 3500
	0    1    1    0   
$EndComp
$Comp
L LED D17
U 1 1 4B91C5FE
P 7700 3500
F 0 "D17" H 7700 3600 50  0000 C CNN
F 1 "LED" H 7700 3400 50  0000 C CNN
	1    7700 3500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR033
U 1 1 4B91C5D0
P 4450 4850
F 0 "#PWR033" H 4450 4850 30  0001 C CNN
F 1 "GND" H 4450 4780 30  0001 C CNN
	1    4450 4850
	1    0    0    -1  
$EndComp
$Comp
L C C51
U 1 1 4B91C5C7
P 4450 4500
F 0 "C51" H 4500 4600 50  0000 L CNN
F 1 "C" H 4500 4400 50  0000 L CNN
	1    4450 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 4B91C584
P 3350 4100
F 0 "#PWR034" H 3350 4100 30  0001 C CNN
F 1 "GND" H 3350 4030 30  0001 C CNN
	1    3350 4100
	1    0    0    -1  
$EndComp
$Comp
L C C50
U 1 1 4B91C563
P 3350 3700
F 0 "C50" H 3400 3800 50  0000 L CNN
F 1 "C" H 3400 3600 50  0000 L CNN
	1    3350 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 4B91C510
P 5550 5350
F 0 "#PWR035" H 5550 5350 30  0001 C CNN
F 1 "GND" H 5550 5280 30  0001 C CNN
	1    5550 5350
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L7
U 1 1 4B91C4C6
P 3850 3150
F 0 "L7" V 3800 3150 40  0000 C CNN
F 1 "Ferrite-Bead" V 3950 3150 40  0000 C CNN
	1    3850 3150
	0    1    1    0   
$EndComp
$Comp
L USB-TYPEB U12
U 1 1 4B91C490
P 2650 3450
F 0 "U12" H 2600 3900 60  0000 C CNN
F 1 "USB-TYPEB" H 2850 2850 60  0000 C CNN
	1    2650 3450
	-1   0    0    -1  
$EndComp
$Comp
L FT232RL U13
U 1 1 4B91C23D
P 5550 3800
F 0 "U13" H 5950 2850 60  0000 C CNN
F 1 "FT232RL" H 5550 4700 60  0000 C CNN
	1    5550 3800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
