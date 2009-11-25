;cargo en el registro CR3 la direccion del Directorio de Tablas de Paginas del traductor y kernel
	mov eax, page_dir_traductorykernel	
	mov cr3, eax

; seteo el bit PG del registro de control CR0 para luego poder habilitar paginacion
	mov eax, cr0				
	or  eax, 0x80000000			
	mov cr0, eax

; escribo el nombre del grupo en la memoria de video a traves de la pagina 0x13000 del traductor y kernel, que esta 
; mapeada a la pagina de la memoria de video (0xB8000)
	mov ecx, mensaje_len		
	mov ah, 0x0c
	mov esi, mensaje
	xor edi, edi
	add edi, (160 * 1) + 2 + 0x13000 
		
 ciclo:
	mov al, [esi]
	mov [edi] , ax
	add edi, 2
	inc esi
	loop ciclo
