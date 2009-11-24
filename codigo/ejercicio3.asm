; inicializo los descriptores de la IDT
	call idtFill

; remapeeamos las interrupciones del vector de interrupciones 
	%include "rutina_de_remapeo_pic.asm"
	
; cargo en el registro LIDT la direccion base de la IDT que armamos en idt.c
	lidt[IDT_DESC]
