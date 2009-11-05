BITS 32

page_dir:			  	
	dd 	0x0000C003 ;0... 0000 1100 0000 0000 0011
	
%rep	0x400 - 1
	dd	0x00000002		;supervisor, read/write, not present
%endrep

page_table_0:
%assign i 0x0000
%rep    0x400
	
    dd 	i | 3			;supervisor, read/write, present
				
%assign i i+4096 
%endrep












