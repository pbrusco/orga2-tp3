mov eax, page_dir_traductorykernel	;cargo la direccion del directorio en cr3
mov cr3, eax

mov eax, cr0				
or  eax, 0x80000000		;habilito paginacion
mov cr0, eax

mov ecx, mensaje_len		
mov ah, 0x0c
mov esi, mensaje
xor edi, edi
add edi, (160 * 1) + 2 + 0x18000	;escribo en video a traves de la pagina 0x13000 del pintor, que esta mapeada a 0xB8000

			
mov ecx, mensaje_len
mov esi, mensaje
mov ah, 0xA0
ciclo:
	mov al, [esi]
	mov [edi] , ax
	add edi, 2
	inc esi
	loop ciclo



