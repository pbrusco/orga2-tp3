; imprimimos por pantalla mensajes de inicializacion	
	IMPRIMIR_MODO_REAL iniciando, iniciando_len, 0x07, 0xFFFF, 0
	IMPRIMIR_MODO_REAL modreal, modreal_len, 0x07, 0, 0
	IMPRIMIR_MODO_REAL cambiando, cambiando_len, 0x07, 0, 0

; habilito el Gate A20 y checkeo que este habilitado
	call enable_A20
	call check_A20
	
; cargo en el registro LGDT la direccion base de la GDT que armamos en gts.asm
	lgdt[GDT_DESC]			

; seteo el bit PE del registro de control CR0 para luego poder habilitar el modo protegido
	mov eax, cr0			
	or eax, 1
	mov cr0, eax

; habilito modo protegido cargando en CS la posicion dentro de la GDT del descriptor del segmento de codigo
	jmp 0x08:modo_protegido


bits 32		; le indico al compilador que el codigo que prosigue es de 32 bits
modo_protegido:
	
; actualizo los selectores para que apunten al descriptor del segmento de datos en la GDT
	mov ax, 0x10
	mov ds, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

; cargo en ES la posicion dentro de la GDT del descriptor del segmento de video
	mov ax, 0x18
	mov es, ax	

; imprimimos por pantalla mensajes de sistema
	IMPRIMIR_TEXTO modprot, modprot_len, 0x07, 0x7, 0, 0xB8000
	

	%include "volverLocoAlProfesor.asm"






; a continuacion cambiamos el color del fondo de la pantalla al color azul
	mov ecx, (25*80) 		; ecx = tamaño de la matriz de video
	mov ah, 0x10			; ah = color de fondo(azul)
	mov al, 0x00			; al = caracter null 
	xor edi, edi			; edi = offset del segmento	

	.ciclo_azul:
		stosw			    ; guarda el contenido de eax en la posición apuntada por edi y avanza el puntero
		loop .ciclo_azul	; repetimos el ciclo hasta haber recorrido toda la matriz de video

	
; seguidamente imprimimos un marco de '#' en el borde superior de la pantalla
	mov ah, 0x90
	mov al, 0x23			; al = caracter #	
	mov ecx, 80d	 		; ecx = tamaño de una fila de la matriz de video
	xor edi, edi			; edi = offset del segmento	
	
	cicloFilaSup:
		stosw				; guarda el contenido de eax en la posición apuntada por edi y avanza el puntero
		loop cicloFilaSup	; repetimos el ciclo hasta haber recorrido toda la fila


; ACLARACION: Al salir del ciclo como stosw incrementa edi en 2, éste está apuntando a la segunda fila de la matriz de video

; imprimimos los bordes verticales del marco en la pantalla
	mov ecx, 23d	 		; ecx = cantidad de filas de la matriz de video - 2
	
	cicloColumnas:
		mov [es:edi], ax	; imprimimos el caracter en pantalla
		add edi, 158d		; edi = offset al final de la fila en la matriz de video
		mov [es:edi], ax	; imprimimos el caracter en pantalla
		add edi, 2			; edi = offset al comienzo de la siguiente fila de la matriz de video
		loop cicloColumnas	; repetimos el ciclo hasta haber recorrido el alto de las columnas

; imprimimos la linea horizontal inferior del marco
	mov ecx, 80d	 		; ecx = tamaño de una fila de la matriz de video
		
	cicloFilaInf:
		stosw				; guarda el contenido de eax en la posición apuntada por edi y avanza el puntero
		loop cicloFilaInf	; repetimosel ciclo hasta haber recorrido toda la fila
