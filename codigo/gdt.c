#include "gdt.h"
#include "tss.h"


/*
 * Definicion de la GDT
 */
gdt_entry gdt[GDT_COUNT] = {

	(gdt_entry){ 				//descriptor nulo
		(unsigned short) 0, 
		(unsigned short) 0,
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 0, 
		(unsigned char) 0,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 0, 
		(unsigned char) 0 
	},
	(gdt_entry){ 				//segmento de codigo
		(unsigned short) 0xffff, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0xA, 
		(unsigned char) 1, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0xf,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},

	(gdt_entry){ 				//segmento de datos
		(unsigned short) 0xffff, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0x2, 
		(unsigned char) 1, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0xf,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1,  
		(unsigned char) 1, 
		(unsigned char) 0x00 
	},

	(gdt_entry){ 				//segmento de video
		(unsigned short) 0x0F9F, 	//limit_0_15;  
		(unsigned short) 0x8000,	//base_0_15;
		(unsigned char) 0x0B, 		//base_23_16;
		(unsigned char) 0x2, 		//type:4;
		(unsigned char) 1, 		//s:1;
		(unsigned char) 0, 		//dpl:2;
		(unsigned char) 1, 		//p:1;
		(unsigned char) 0x0,		//limit_16_19:4;
		(unsigned char) 0,  		//avl:1;
		(unsigned char) 0,  		//l:1;
		(unsigned char) 1,  		//db:1;
		(unsigned char) 1, 		//g:1;
		(unsigned char) 0x00 		//base_31_24;
	},

	
};

/*
 * Definicion del GDTR
 */ 
gdt_descriptor GDT_DESC = {sizeof(gdt)-1, (unsigned int)&gdt};
