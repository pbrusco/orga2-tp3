
	IMPRIMIR_TEXTO pulse, pulse_len, 0x07, 0x8, 0, 0xB8000
	IMPRIMIR_TEXTO elNombre, elNombre_len, 0x8B, 0x9, 0, 0xB8000	
	IMPRIMIR_TEXTO pista, pista_len, 0x01, 0x16, 0x45, 0xB8000	
		


P1:	
	in al, 0x60			
	cmp al,0xCA				;TECLA			; comparamos con el valor de la tecla ESC
	je TOPSECRET			; repitimos el ciclo hasta que el usuario presione ESC
	cmp al,0x99				;TECLA			; comparamos con el valor de la tecla ESC
	jnz P1				; repitimos el ciclo hasta que el usuario presione ESC

U1:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0x96				;TECLA			; comparamos con el valor de la tecla ESC
	jnz U1				; repitimos el ciclo hasta que el usuario presione ESC

N1:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0xB1				;TECLA			; comparamos con el valor de la tecla ESC
	jnz N1				; repitimos el ciclo hasta que el usuario presione ESC

P2:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0x99				;TECLA			; comparamos con el valor de la tecla ESC
	jnz P2				; repitimos el ciclo hasta que el usuario presione ESC

C1:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0xAE				;TECLA			; comparamos con el valor de la tecla ESC
	jnz C1				; repitimos el ciclo hasta que el usuario presione ESC


K1:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0xA5				;TECLA			; comparamos con el valor de la tecla ESC
	jnz K1				; repitimos el ciclo hasta que el usuario presione ESC

H1:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0xA3				;TECLA			; comparamos con el valor de la tecla ESC
	jnz H1				; repitimos el ciclo hasta que el usuario presione ESC

Q1:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0x90				;TECLA			; comparamos con el valor de la tecla ESC
	jnz Q1				; repitimos el ciclo hasta que el usuario presione ESC

D1:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0xA0				;TECLA			; comparamos con el valor de la tecla ESC
	jnz D1				; repitimos el ciclo hasta que el usuario presione ESC

Q2:	
	in al, 0x60				; leemos el puerto de teclado
	cmp al,0x90				;TECLA			; comparamos con el valor de la tecla ESC
	jnz Q2				; repitimos el ciclo hasta que el usuario presione ESC




TOPSECRET:

 
