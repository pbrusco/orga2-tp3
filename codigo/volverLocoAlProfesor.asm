
	IMPRIMIR_TEXTO pulse, pulse_len, 0x07, 0x8, 0, 0xB8000
	IMPRIMIR_TEXTO elNombre, elNombre_len, 0x8B, 0x9, 0, 0xB8000	
	IMPRIMIR_TEXTO pista, pista_len, 0x01, 0x16, 0x45, 0xB8000	
		


P1:	
	in al, 0x60			
	cmp al,0xCA				
	je TOPSECRET			
	cmp al,0x99				
	jnz P1				

U1:	
	in al, 0x60				
	cmp al,0x96				
	jnz U1				

N1:	
	in al, 0x60				
	cmp al,0xB1				
	jnz N1				

P2:	
	in al, 0x60				
	cmp al,0x99				
	jnz P2				

C1:	
	in al, 0x60				
	cmp al,0xAE				
	jnz C1				


K1:	
	in al, 0x60				
	cmp al,0xA5			
	jnz K1				

H1:	
	in al, 0x60			
	cmp al,0xA3			
	jnz H1				

Q1:	
	in al, 0x60				
	cmp al,0x90				
	jnz Q1				

D1:	
	in al, 0x60				
	cmp al,0xA0				
	jnz D1				

Q2:	
	in al, 0x60				
	cmp al,0x90				
	jnz Q2				




TOPSECRET:

 
