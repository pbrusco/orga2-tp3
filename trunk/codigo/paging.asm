BITS 32

page_dir_pintor:			;arranca en la posicion 0xA000
	dd 	0x0000C003 		;la primer entrada apunta a la tabla de pagina ubicada en 0xC000, supervisor|read/write|presente
	
%rep	0x400 - 1
	dd	0x00000002		;supervisor, read/write, not present
%endrep

page_dir_traductorykernel:		;arranca en la posicion 0xB000
	dd 	0x0000D003 		;la primer entrada apunta a la tabla de pagina ubicada en 0xD000, supervisor|read/write|presente
	
%rep	0x400 - 1
	dd	0x00000002		;supervisor, read/write, not present
%endrep




page_table_pintor:

%assign i 0x0000			;0000 - 8FFF --> 0000 - 8FFF
%rep    0x9				
dd i | 3				;supervisor, read/write, presente
%assign i i+4096
%endrep


%assign i 0x9000			;9000 - DFFF --> 9000 - DFFF
%rep    0x5				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


%assign i 0xE000			;E000 - FFFF --> E000 - FFFF
%rep    0x2
	
    dd 	i | 3				;supervisor, read/write, present
				
%assign i i+4096 
%endrep


%assign i 0x10000			;10000 - 12FFF --> 10000 - 12FFF
%rep    0x3				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


%assign i 0xB8000			;13000 - 13FFF --> B8000 - B8FFF
%rep    0x1
	
    dd 	i | 3				;supervisor, read/write, present
				
%assign i i+4096 
%endrep


%assign i 0x14000			;14000 - 14FFF --> 14000 - 14FFF
%rep    0x1
	
    dd 	i | 2				;supervisor, read/write, no presente
%endrep


%assign i 0x15000			;15000 - 15FFF --> 15000 - 15FFF
%rep    0x1
	
    dd 	i | 3				;supervisor, read/write, present
%endrep


%assign i 0x16000			;16000 - B7FFF --> 16000 - B7FFF
%rep    0xA2				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


					;B8000 - B8FFF --> 10000 - 10FFF
dd 	0x10003				;supervisor, read/write, present


%assign i 0xB9000			;B9000 - 3FFFFF--> B9000 - 3FFFFF
%rep    0x347				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


page_table_traductorykernel:

%assign i 0x0000			;0000 - 7FFF --> 0000 - 7FFF
%rep    0x8				
dd i | 3				;supervisor, read/write, presente
%assign i i+4096
%endrep

%assign i 0x8000			;8000 - 8FFF --> 8000 - 8FFF
%rep    0x1				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


%assign i 0x9000			;9000 - 10FFF --> 9000 - 10FFF
%rep    0x8				
dd i | 3				;supervisor, read/write, presente
%assign i i+4096
%endrep


%assign i 0x11000			;11000 - 12FFF --> 11000 - 12FFF
%rep    0x2				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


%assign i 0xB8000			;13000 - 13FFF --> B8000 - B8FFF
%rep    0x1				
dd i | 3				;supervisor, read/write, presente
%assign i i+4096
%endrep


%assign i 0x14000			;14000 - 15FFF --> 14000 - 15FFF
%rep    0x2				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


%assign i 0x16000			;16000 - 16FFF --> 16000 - 16FFF
%rep    0x1				
dd i | 3				;supervisor, read/write, presente
%assign i i+4096
%endrep


%assign i 0x17000			;17000 - 17FFF --> 17000 - 17FFF
%rep    0x1				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


%assign i 0xB8000			;18000 - 18FFF --> B8000 - B8FFF
%rep    0x1				
dd i | 3				;supervisor, read/write, presente
%assign i i+4096
%endrep


%assign i 0x19000			;19000 - 9FFFF --> 19000 - 9FFFF
%rep    0x87				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep


%assign i 0xA0000			;A0000 - BFFFF --> A0000 - BFFFF
%rep    0x20				
dd i | 3				;supervisor, read/write, presente
%assign i i+4096
%endrep


%assign i 0xC0000			;C0000 - 3FFFFF --> C0000 - 3FFFFF
%rep    0x340				
dd i | 2				;supervisor, read/write, no presente
%assign i i+4096
%endrep
