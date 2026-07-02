.include "m64def.inc"

.org 0x0000
	jmp main

.org 0x0020
	jmp Timer0_ISR

.org 0x0050
main:
	ldi r16,high(RAMEND)
	out SPH,r16
	ldi r16,low(RAMEND)
	out SPL,r16

	ldi r16,0x80
	out DDRC,r16
	
	ldi r16,0x00
	out DDRE,r16
	out DDRD,r16
	out DDRA,r16
	out DDRB,r16

	//letter1
	in r17,PINB
	lsr r17
	lsr r17
	lsr r17

	//letter2
	in r18,PINA
	lsr r18
	lsr r18
	lsr r18
	andi r18,0x18
	ori r18,0xE0
	in r16,PINB
	lsl r16
	lsl r16
	lsl r16
	lsl r16
	lsl r16
	ori r16,0x18
	and r18,r16
	lsr r18
	lsr r18
	lsr r18

	//letter3
	in r19,PINA
	andi r19,0x1F

	//letter4
	in r29,PIND
	andi r29,0x1F

	//letter5
	in r28,PIND
	lsr r28
	lsr r28
	lsr r28
	andi r28,0x18
	ori r28,0xE0
	in r16,PINE
	lsl r16
	lsl r16
	lsl r16
	lsl r16
	lsl r16
	ori r16,0x18
	and r28,r16
	lsr r28
	lsr r28
	lsr r28

	//letter6
	in r27,PINE
	lsr r27
	lsr r27
	lsr r27


	//
	in r16,PINC 
	andi r16,0x0F
	cpi r16,0x00
	breq Status1
	cpi r16,0x01
	breq Status2
	cpi r16,0x02
	breq Status3
	cpi r16,0x03
	breq Status4
	cpi r16,0x04
	breq Status5
	cpi r16,0x05
	breq Status6
	cpi r16,0x06
	breq Status7
	cpi r16,0x07
	breq Status8
	cpi r16,0x08
	breq Status9
	cpi r16,0x09
	breq Status10

	Status1:
		ldi r24,1
		ldi r25,3
		ldi r26,8
		jmp END

	Status2:
		ldi r24,2
		ldi r25,6
		ldi r26,16
		jmp END

	Status3:
		ldi r24,3
		ldi r25,9
		ldi r26,24
		jmp END

	Status4:
		ldi r24,4
		ldi r25,12
		ldi r26,32
		jmp END

	Status5:
		ldi r24,5
		ldi r25,15
		ldi r26,40
		jmp END

	Status6:
		ldi r24,6
		ldi r25,18
		ldi r26,48
		jmp END

	Status7:
		ldi r24,7
		ldi r25,21
		ldi r26,56
		jmp END

	Status8:
		ldi r24,8
		ldi r25,24
		ldi r26,64
		jmp END

	Status9:
		ldi r24,9
		ldi r25,27
		ldi r26,72
		jmp END

	Status10:
		ldi r24,10
		ldi r25,30
		ldi r26,80
		jmp END

	END:
		ldi r20, 0x07
		out TCCR0, r20
		ldi r20,231
		out TCNT0, r20
		ldi r20,0x01
		out TIMSK, r20

		sei

Loop:
	mov r30,r17
	call Letter_Selection
	call DELAY_BETWEEN_LETTERS

	mov r30,r18
	call Letter_Selection
	call DELAY_BETWEEN_LETTERS

	mov r30,r19
	call Letter_Selection
	call DELAY_BETWEEN_LETTERS

	mov r30,r29
	call Letter_Selection
	call DELAY_BETWEEN_LETTERS

	mov r30,r28
	call Letter_Selection
	call DELAY_BETWEEN_LETTERS

	mov r30,r27
	call Letter_Selection
	call DELAY_BETWEEN_WORDS 

	jmp Loop

Letter_Selection:
	
	Letter_A:
	cpi r30,0x00
	brne Letter_B
	call MORSE_A

	Letter_B:
	cpi r30,0x01
	brne Letter_C
	call MORSE_B

	Letter_C:
	cpi r30,0x02
	brne Letter_D
	call MORSE_C

	Letter_D:
	cpi r30,0x03
	brne Letter_E
	call MORSE_D

	Letter_E:
	cpi r30,0x04
	brne Letter_F
	call MORSE_E

	Letter_F:
	cpi r30,0x05
	brne Letter_G
	call MORSE_F

	Letter_G:
	cpi r30,0x06
	brne Letter_H
	call MORSE_G

	Letter_H:
	cpi r30,0x07
	brne Letter_I
	call MORSE_H

	Letter_I:
	cpi r30,0x08
	brne Letter_J
	call MORSE_I

	Letter_J:
	cpi r30,0x09
	brne Letter_K
	call MORSE_J

	Letter_K:
	cpi r30,0x0A
	brne Letter_L
	call MORSE_K

	Letter_L:
	cpi r30,0x0B
	brne Letter_M
	call MORSE_L

	Letter_M:
	cpi r30,0x0C
	brne Letter_N
	call MORSE_M

	Letter_N:
	cpi r30,0x0D
	brne Letter_O
	call MORSE_N

	Letter_O:
	cpi r30,0x0E
	brne Letter_P
	call MORSE_O

	Letter_P:
	cpi r30,0x0F
	brne Letter_Q
	call MORSE_P

	Letter_Q:
	cpi r30,0x10
	brne Letter_R
	call MORSE_Q

	Letter_R:
	cpi r30,0x11
	brne Letter_S
	call MORSE_R

	Letter_S:
	cpi r30,0x12
	brne Letter_T
	call MORSE_S

	Letter_T:
	cpi r30,0x13
	brne Letter_U
	call MORSE_T

	Letter_U:
	cpi r30,0x14
	brne Letter_V
	call MORSE_U

	Letter_V:
	cpi r30,0x15
	brne Letter_W
	call MORSE_V

	Letter_W:
	cpi r30,0x16
	brne Letter_X
	call MORSE_W

	Letter_X:
	cpi r30,0x17
	brne Letter_Y
	call MORSE_X

	Letter_Y:
	cpi r30,0x18
	brne Letter_Z
	call MORSE_Y

	Letter_Z:
	cpi r30,0x19
	brne Error
	call MORSE_Z
	Error:
	ret


//Morse code alphabet
MORSE_A:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_B:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_C:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_D:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_E:
    call DOT
    ret

MORSE_F:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_G:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_H:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_I:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_J:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_K:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_L:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_M:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_N:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_O:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_P:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_Q:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_R:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_S:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

MORSE_T:
    call DASH
    ret

MORSE_U:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_V:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_W:
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_X:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_Y:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
    ret

MORSE_Z:
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DASH
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
	call DELAY_FOR_LETTER_COMPONENTS
    call DOT
    ret

//Dot_Dash
DOT:
	sbi PORTC,7
	call DELAY_FOR_DOT
	cbi PORTC,7                  
    ret

DASH:
	sbi PORTC,7    
    call DELAY_FOR_DASH
	cbi PORTC,7    
    ret


//Delays
DELAY_FOR_DOT:
    cp r22,r24
    brne DELAY_FOR_DOT	   
    clr r22
    ret


DELAY_FOR_DASH:
    cp r22,r25
    brne DELAY_FOR_DASH	   
	clr r22
    ret


DELAY_FOR_LETTER_COMPONENTS:
    cp r22,r24
    brne DELAY_FOR_LETTER_COMPONENTS	   
	clr r22
    ret

DELAY_BETWEEN_LETTERS:
    cp r22,r25
    brne DELAY_BETWEEN_LETTERS	   
	clr r22
    ret

DELAY_BETWEEN_WORDS:
    cp r22,r26
    brne DELAY_BETWEEN_WORDS
	clr r22
    ret


//Timer
Timer0_ISR:
    ldi r20, 231
	out TCNT0, r20
    inc r22           
    reti

