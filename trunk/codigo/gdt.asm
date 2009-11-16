



gdt: 	dd 0,0

	dw 0xffff
	dw 0x0000
	db 0x00
	db 0x9A 
	db 0xCF
	db 0x00

	dw 0xffff 
	dw 0x0000
	db 0x00 
	db 0x92 	
	db 0xCF 	
	db 0x00

	dw 0x0f9f	;	unsigned short limit_0_15;
	dw 0x8000	;	unsigned short base_0_15;
	db 0x0B		;	unsigned char base_23_16;
 	db 0x92 	;	unsigned char type:4;
			;	unsigned char s:1;
			;	unsigned char dpl:2;
			;	unsigned char p:1;
	
	db 0xC0		;	unsigned char limit_16_19:4;
			;	unsigned char avl:1;
			;	unsigned char l:1;
			;	unsigned char db:1;
			;	unsigned char g:1;

	db 0x00		;	unsigned char base_31_24;


tam equ $-gdt-1
GDT_DESC:	dw tam
		dd gdt





