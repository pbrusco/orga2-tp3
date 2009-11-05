call page_init			;esto me inicializa el directorio
	
		mov eax, page_dir		;cargo la direccion del directorio en cr3
		mov cr3, eax
	
		mov eax, cr0				
		or  eax, 0x80000000		;habilito paginacion
		mov cr0, eax
		
		
		mov ecx, mensaje_len		
		mov ah, 0x0c
		mov esi, mensaje
		xor edi, edi
		add edi, (160 * 10) + 14 + 0xB8000	; accedo a la memoria de video a traves del 
							; segmento de datos con offset 0xb8000 + lugar
							; en la pantalla donde quiero escribir
		.ciclo:
			lodsb 		; lee desde ds:esi e incrementa esi en 1
			stosw 		; escribe en es:edi e incrementa edi en 2
			loop .ciclo

					mov edi, 0
					mov al, '*'
					mov ah, 0xc0
					mov ecx, 80
					xchg bx,bx
					cicloFilaArriba:
						mov [es:edi], ax
						add edi, 2
						loop cicloFilaArriba
					
					mov ecx, 23
					cicloBordes:
						mov [es:edi], ax
						add edi, 158
						mov [es:edi], ax
						add edi, 2
						loop cicloBordes
					mov ecx, 80
					cicloFilaAbajo:
						mov [es:edi], ax
						add edi, 2
						loop cicloFilaAbajo



		jmp $

mensaje db "Hola Mundo, con segmentacion flat e identity mapping!",0
mensaje_len equ $-mensaje 
%include "paging.asm"