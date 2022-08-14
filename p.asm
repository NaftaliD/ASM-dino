;--------------------------------------------------------------------------------------
; GVAHIM 
; 
; Template program for .COM files 
;--------------------------------------------------------------------------------------


ideal
model tiny
include "c:\gvahim\gvahim.mac"
dataseg

;--------------------------------------------------------------------------------------
; Begin Data definitions
;--------------------------------------------------------------------------------------
dinoY dw 199
jump dw 0 ;represnts the frame of the jump we currently in -- ignore_line
isHit dw 0 ;the function isHit puts this on 1 if there was a hit
counter dw ? 
counter2 dw ?
obsAmount dw 0 ;how much obstacle are in the sequence
speed dw 3 ;speed of movemnt
obsCount dw 0 ;how much obstacle of this sequence that are alredy printed
obsX dw 0 ;the x value of the last obstacle

maxSpeed equ 12
accleration equ 1
obsWidth equ 7 ;the width of the obstacle
obsHight equ 11 ;the hight of the obstacle
obsDistance equ 180 ;the distance between obstacle inside of a sequence
seqDistance equ 310 ;the distance between sequences
maxObs equ 5 ;the max amount of obstacle in a sequence
minObs equ 3 ;the min amount of obstacle in a sequence
jumpHight equ 60 ;ignore_line
framesPerJump equ 15 ;how long will the jump last
dinoX equ 25
dinoYbasic equ 199 ;the starter dino y positon
dinoHight equ 24
dinowidth equ 20
screenHight equ 200
screenwidth equ 320
;--------------------------------------------------------------------------------------
; End   Data definitions 
;--------------------------------------------------------------------------------------

codeseg
org 100h
ENTRY: 

;--------------------------------------------------------------------------------------
; Begin Instructions (Main)
;--------------------------------------------------------------------------------------
mov ah, 0h
mov al, 13h
int 10h ;put into graphic mode
call drawDino
loop1:
	call frameClock
	call funJump	
	call drawDino
	call obstacle
	call check_isHit
cmp [isHit], 0
je loop1

    ret     ; Return to O/S - Last instruction
;--------------------------------------------------------------------------------------
; End   Instructions (Main)
;--------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------
; Begin Functions
;--------------------------------------------------------------------------------------
proc drawLine; al color, dx start Y, cx start X, bx len
	push bx
	push ax
	mov ah, 0Ch
	@@loop1:
		int 10h
		inc cx
		dec bx
		cmp bx, 0
		ja @@loop1
	pop ax
	pop bx
	ret
endp drawLine
;---------------------------------------
proc drawDinoLine1 ;al color
	mov cx, dinoX+5;line 1
	mov dx, [dinoY]
	mov bx, 2
	call drawLine
	add cx, 3
	call drawLine
	ret
endp drawDinoLine1
;--------------------------------------
proc drawDinoLine2;al color
	mov cx, dinoX+5;line 2
	dec dx
	mov bx, 1
	call drawLine
	add cx, 4
	call drawLine
	ret
endp drawDinoLine2
;--------------------------------------
proc drawDinoLine3;al color
	mov cx, dinoX+5
	dec dx
	mov bx, 2
	call drawLine
	add cx, 3
	dec bx
	call drawLine
	ret
endp drawDinoLine3
;--------------------------------------
proc drawDinoLine4;al color
	mov cx, dinoX+5
	dec dx
	mov bx, 3
	call drawLine
	add cx, 1
	dec bx
	call drawLine
	ret
endp drawDinoLine4
;--------------------------------------
proc drawDinoLine5;al color
	mov cx, dinoX+4
	dec dx
	mov bx, 7
	call drawLine
	ret
endp drawDinoLine5
;--------------------------------------
proc drawDinoLine6;al color
	mov cx, dinoX+3
	dec dx
	mov bx, 9
	call drawLine
	ret
endp drawDinoLine6
;--------------------------------------
proc drawDinoLine7;al color
	mov cx, dinoX+2
	dec dx
	mov bx, 11
	call drawLine
	ret
endp drawDinoLine7
;--------------------------------------
proc drawDinoLine8;al color
	mov cx, dinoX+1
	dec dx
	mov bx, 12
	call drawLine
	ret
endp drawDinoLine8
;--------------------------------------
proc drawDinoLine9;al color
	mov cx, dinoX
	dec dx
	mov bx, 14
	call drawLine
	ret
endp drawDinoLine9
;--------------------------------------
proc drawDinoLine10;al color
	mov cx, dinoX
	dec dx
	mov bx, 14
	call drawLine
	ret
endp drawDinoLine10
;--------------------------------------
proc drawDinoLine11;al color
	mov cx, dinoX
	dec dx
	mov bx, 14
	call drawLine
	ret
endp drawDinoLine11
;--------------------------------------
proc drawDinoLine12;al color
	mov cx, dinoX
	dec dx
	mov bx, 3
	call drawLine
	add cx, 2
	mov bx, 9
	call drawLine
	add cx, 1
	mov bx, 1
	call drawLine
	ret
endp drawDinoLine12
;--------------------------------------
proc drawDinoLine13;al color
	mov cx, dinoX
	dec dx
	mov bx, 2
	call drawLine
	add cx, 4
	mov bx, 10
	call drawLine
	ret
endp drawDinoLine13
;--------------------------------------
proc drawDinoLine14;al color
	mov cx, dinoX
	dec dx
	mov bx, 1
	call drawLine
	add cx, 6
	mov bx, 7
	call drawLine
	ret
endp drawDinoLine14
;--------------------------------------
proc drawDinoLine15;al color
	mov cx, dinoX
	dec dx
	mov bx, 1
	call drawLine
	add cx, 8
	mov bx, 5
	call drawLine
	ret
endp drawDinoLine15
;--------------------------------------
proc drawDinoLine16;al color
	mov cx, dinoX+10
	dec dx
	mov bx, 8
	call drawLine
	ret
endp drawDinoLine16
;--------------------------------------
proc drawDinoLine17;al color
	mov cx, dinoX+10
	dec dx
	mov bx, 5
	call drawLine
	ret
endp drawDinoLine17
;--------------------------------------
proc drawDinoLine18;al color
	mov cx, dinoX+10
	dec dx
	mov bx, 10
	call drawLine
	ret
endp drawDinoLine18
;--------------------------------------
proc drawDinoLine19;al color
	mov cx, dinoX+10
	dec dx
	mov bx, 10
	call drawLine
	ret
endp drawDinoLine19
;--------------------------------------
proc drawDinoLine20;al color
	mov cx, dinoX+10
	dec dx
	mov bx, 10
	call drawLine
	ret
endp drawDinoLine20
;--------------------------------------
proc drawDinoLine21;al color
	mov cx, dinoX+10
	dec dx
	mov bx, 10
	call drawLine
	ret
endp drawDinoLine21
;--------------------------------------
proc drawDinoLine22;al color
	mov cx, dinoX+10
	dec dx
	mov bx, 2
	call drawLine
	add cx, 1
	mov bx, 7
	call drawLine
	ret
endp drawDinoLine22
;--------------------------------------
proc drawDinoLine23;al color
	mov cx, dinoX+11
	dec dx
	mov bx, 8
	call drawLine
	ret
endp drawDinoLine23
;-------------------------------------
proc drawDino; dinoX, dinoY
	mov al, 0Fh; color 0Fh = white
	call drawDinoLine1
	call drawDinoLine2
	call drawDinoLine3
	call drawDinoLine4
	call drawDinoLine5
	call drawDinoLine6
	call drawDinoLine7
	call drawDinoLine8
	call drawDinoLine9
	call drawDinoLine10
	call drawDinoLine11
	call drawDinoLine12
	call drawDinoLine13
	call drawDinoLine14
	call drawDinoLine15
	call drawDinoLine16
	call drawDinoLine17
	call drawDinoLine18
	call drawDinoLine19
	call drawDinoLine20
	call drawDinoLine21
	call drawDinoLine22
	call drawDinoLine23
	ret
endp drawDino
;--------------------------------------------------------------------------------------
proc drawObs;cx starter x, al color
	mov dx, dinoYbasic + 1
	push cx
	cmp cx, obsWidth	;check if when painting we will paint below 0
	jb @@end
	sub cx, obsWidth	;move to the starter x point of the start of the obstacle
	add cx, 2   ;distance to the mid part of the obstacle
	mov [counter], 0
	@@loop1:
	cmp [counter], 6 ;6 lines which are same
	je @@topart
		dec dx
		mov bx, 3
		call drawLine
		sub cx, 3
		inc [counter]		
		jmp @@loop1
	@@topart: ;rest of the lines
		dec dx
		dec cx
		mov bx, 5
		call drawLine
		sub cx, 5
		;------------
		dec dx 
		dec cx
		mov bx, 7
		call drawLine
		sub cx, 7
		;--------------
		dec dx
		mov bx, 3
		call drawLine
		inc cx 
		call drawLine
		sub cx, 7
		;---------------
		dec dx
		mov bx, 3
		call drawLine
		inc cx 
		call drawLine
		sub cx, 7
		;---------------
		dec dx
		inc cx
		mov bx, 1
		call drawLine
		add cx, 3
		call drawLine
	@@end:
	pop cx
	ret
endp drawObs
;--------------------------------------------------------------------------------------
proc drawAllObs ;al - color
	mov [counter2], 0
	mov cx, [obsX] ;we dont want to change obsX
	add cx, obsDistance ;because we take down that amount every run but the first need to be the starter obsX
	@@loop1:
	mov bx, [counter2]
	cmp [obsCount], bx ;the loop runs over all the current obstacle
	je @@end	;the run finished
		cmp cx, obsDistance+obsWidth 
		jb @@end	;if cx is below obsDistance+obsWidth so the next obstacle is at least partly below zero, and we dont want to draw it
		sub cx, obsDistance ;move to the next obstacle
		call drawObs
		inc [counter2]
	jmp @@loop1
	@@end:
	ret
endp drawAllObs
;--------------------------------------------------------------------------------------
proc obstacle
	mov ax, [obsCount]
	cmp [obsAmount], ax ;check if there is more obstacles in the sequence then the one we alredy painted
	jne @@midSeq
	cmp [obsX], screenwidth-seqDistance ;if we alredy painted all the obstacles, we check if we need to start the next sequence
	ja @@movObs
		mov al, 0 ;black
		call drawAllObs ;delete the old obstacles
		call rand ;finds a random number to be the lenght of the next sequence(output is ax)
		mov [obsAmount], ax
		mov [obsX], screenwidth ;the start point of the sequence
		mov [obsCount], 1
	@@movObs:
		mov al, 0 ;black
		call drawAllObs ;delete the old obstacles
		mov ax, [speed]
		sub [obsX], ax	;move the obstacles
		mov al, 0Fh ;white
		call drawAllObs ;draw the obstacles
		jmp @@end
	@@midSeq:
		cmp [obsX], screenwidth-obsDistance ;checks we need to put another obstacle 
		ja @@movObs	;no
			add [obsX], obsDistance ;move the obsX to the new last obstacle
			inc [obsCount] ;we now have one more obstacle to paint
			call acclerationFun ;increase the speed
			jmp @@movObs
	@@end:
	ret
endp obstacle
;--------------------------------------------------------------------------------------
proc funJump
	cmp [dinoY], dinoYbasic ;checks if we are mid jump
	je @@checkForJump
	jmp @@jump1
	@@checkForJump:
		call get_key	;gets input
		cmp ax, 0 ;if ax is 0 then there is no input
		je @@end
		mov [jump], 0 ;start a jump from now, so we are at frame 0
	@@jump1:
		call clearDino ;we are about to move the dino so we delete the old one
		cmp [jump], framesPerJump/2 ;checks if we need to go up or down
		jna @@goUp
			add [dinoY], jumpHight/framesPerJump ;because y max is the lowest, to get the dino down we need to increase y 
			inc [jump] ;move a frame
			jmp @@end
		@@goUp:
			sub [dinoY], jumpHight/framesPerJump ;because y max is the lowest, to get the dino up we need to sub from y 
			inc [jump]
	@@end:
	ret
endp funJump
;-----------------------------------------------------------------------
proc get_key
	mov ah, 1h
	int 16h ;check if there is an input
	jz @@end
	mov ah, 0
	int 16h ;takes an input
	cmp al, ' ' ;checks if its the input we want
	jne @@end
	@@loop1: ;this loop calls for all the inputs the computer has already taken, so next time we will only jump from a new input
		mov ah, 1h
		int 16h ;check if there is an input
		jz @@end_loop1
		mov ah, 0
		int 16h ;takes an input
		jmp @@loop1
		@@end_loop1:
		mov ax, 1 ;we got ' ' as an input
		jmp @@rEnd
	@@end:
		mov ax, 0 ;we didnt got ' ' as an input
	@@rEnd:
	
	ret
endp get_key
;--------------------------------------------------------------------------------------
proc clearDino 
	mov al, 0 ;black color
	mov bx, dinowidth ;lenght of the line we want to paint in black(clear)
	mov dx, [dinoY] ;the y input
	inc dx
	mov [counter], 1
	@@loop1:
		mov cx, dinoX ;the start x
		dec dx ;move to the next line
		call drawLine
		inc [counter]
	cmp [counter], dinoHight ;checks we cleared all of the dino lines
	jne @@loop1
	ret
endp clearDino
;--------------------------------------------------------------------------------------
proc frameClock ;a wait function
	mov ah, 86h
	mov cx, 0
	mov dx, 50000
	int 15h
	ret
endp frameClock
;--------------------------------------------------------------------------------------
proc acclerationFun
	cmp [speed], maxSpeed ;checks that we didnt reach the max speed
	je @@end
	add [speed], accleration
	@@end:
	ret
endp acclerationFun
;--------------------------------------------------------------------------------------
proc rand ; returns: ax-random number
	MOV AH, 02Ch
	INT 21H ;take the number from the clock
	MOV Ax, dx ;dl cantains the meli-seconds
	MOV ah, 0
	mov bl, maxObs - minObs + 1 ;we want to do modulu on the number of posbiltes of the length of the number
	DIV	bl ;divides ax at the input
	mov al, ah ;the reminder is in ah
	ADD al, minObs ;so the number we get will be the range we want
	mov ah, 0 ;the output is ax, so we dont want any value in ah
	ret
endp rand
;--------------------------------------------------------------------------------------
proc check_isHit
	mov [counter2], 0
	mov cx, [obsX]
	sub cx, obsWidth  ;take the point at the start of the obstacle, and not at the end
	add cx, obsDistance ;because we take down that amount every run but the first need to be the starter obsX
	@@loop1:
	mov bx, [counter2]
	cmp [obsCount], bx
	je @@end
		cmp cx, obsDistance
		jb @@end ;if cx is below obsDistance so the next obstacle is below zero, and we dont want to draw it
		sub cx, obsDistance
		inc [counter2]
		cmp cx, dinoX ;the start of the hit box
		jb @@end ;the next one must be below as well
		cmp cx, dinoX+12 ;hit box of the legs ends 12 pixels fron dinox
		ja @@loop1
		cmp [dinoY], screenHight-obsHight ;checks if the dino is in the y range of the obstacle
		jb @@loop1
		mov [isHit], 1 ;the dino hited the obstacle
		
	@@end:
	ret
endp check_isHit
;--------------------------------------------------------------------------------------
; End Functions
;--------------------------------------------------------------------------------------

include "c:\gvahim\gvahim.asm"
end ENTRY
