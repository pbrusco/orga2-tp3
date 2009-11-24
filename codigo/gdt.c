#include "gdt.h"
#include "tss.h"


/*
 * Definicion de la GDT
 */
gdt_entry gdt[GDT_COUNT] = {
	/* Descriptor nulo*/
	(gdt_entry){ 
		(unsigned short) 0x0000, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0x0, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 0x0000,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 0, 
		(unsigned char) 0x00 
	},
/*descriptor de codigo*/
(gdt_entry){ 
		(unsigned short) 0xFFFF, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0xA, 
		(unsigned char) 1, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0xF,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},
/*descriptor de datos*/
(gdt_entry){ 
		(unsigned short) 0xFFFF, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0x2, 
		(unsigned char) 1, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0xF,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},
/*descriptor de video*/
(gdt_entry){ 
		(unsigned short) 0x0f9f, 
		(unsigned short) 0x8000,
		(unsigned char) 0x0B, 
		(unsigned char) 0x2, 
		(unsigned char) 1, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0x0,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},
/*descriptor de task 0*/
(gdt_entry){ 
		(unsigned short) 0x0067, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0x9, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0x0,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},
/*descriptor de task 1*/
(gdt_entry){ 
		(unsigned short) 0x0067, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0x9, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0x0,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},
/*descriptor de task 2*/
(gdt_entry){ 
		(unsigned short) 0x0067, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0x9, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0x0,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},
   
	
};

/*
 * Definicion del GDTR
 */ 
gdt_descriptor GDT_DESC = {sizeof(gdt)-1, (unsigned int)&gdt};
