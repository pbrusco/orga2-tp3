; inicializo los descriptores de la IDT
	call idtFill

; remapeamos las interrupciones del vector de interrupciones 
	%include "rutina_de_remapeo_pic.asm"
	
; cargo en el registro IDTR la direccion base y el limite de la IDT que armamos en idt.c
	lidt[IDT_DESC]
