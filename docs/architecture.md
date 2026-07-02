\# System Architecture



\## Overview



The system architecture is designed to generate Morse code using an ATmega64 microcontroller and display the generated signal using an LED and waveform output.



The overall system consists of multiple modules:



1\. User Input Module

2\. Letter Decoder

3\. Morse Code Generator

4\. Timer System

5\. Output System



\---



\## Block Diagram



Input Switches

&#x20;       │

&#x20;       ▼



Letter Decoder

&#x20;       │

&#x20;       ▼



Morse Generator

&#x20;       │

&#x20;       ▼



Timer System

&#x20;       │

&#x20;       ▼



LED Output



\---



\## Components Description



\### Input Switches



Input switches connected to microcontroller ports are used to determine:



\- User-selected letters

\- Speed mode selection



\---



\### Letter Decoder



This module determines which character corresponds to the received binary identifier.



\---



\### Morse Generator



This module converts selected letters into Morse code symbols.



Supported symbols:



\- Dot

\- Dash



\---



\### Timer System



Timer0 is used to generate accurate delays required for:



\- Dot timing

\- Dash timing

\- Symbol spacing

\- Character spacing

\- Word spacing



\---



\### Output System



The output system controls:



\- LED blinking

\- Waveform generation



\---



\## Hardware Components



\- ATmega64

\- LED

\- Resistor

\- Input Switches

\- Proteus Simulation Environment



\---



\## Software Components



\- AVR Assembly Language

\- Timer0 Configuration

\- Port I/O Management



\---



\## Design Goals



\- Accurate timing

\- Expandable architecture

\- Modular implementation

\- Easy Morse code extension



