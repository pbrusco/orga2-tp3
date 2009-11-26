#include "gdt.h"
#include "tss.h"

// Definicion de la GDT
gdt_entry gdt[GDT_COUNT] = {
    	
    	/* Descriptor de segmento nulo*/
	(gdt_entry){(unsigned short) 0x00000000, (unsigned short) 0x00000000},
    	
    	/* Descriptor de segmento de codigo*/
	(gdt_entry){ 
		(unsigned short) 0xFFFF,	//limit 0:15 	(16 bits)
		(unsigned short) 0x0000,	//base 0:15		(16 bits)
		(unsigned char) 0x00, 		//base 23:16	(7 bits)
		(unsigned char) 0xA, 		//type 			(4 bits)
		(unsigned char) 1, 			//system		(1 bit)
		(unsigned char) 0, 			//dpl			(2 bits)
		(unsigned char) 1, 			//present 		(1 bit)
		(unsigned char) 0xF,		//limit_16_19	(4 bit)
		(unsigned char) 0,  		//avaible		(1 bit)
		(unsigned char) 0,  		//l				(1 bit)
		(unsigned char) 1,  		//d/b			(1 bit)
		(unsigned char) 1, 			//granularity	(1 bit)
		(unsigned char) 0x00 		//base_31_24	(16 bits)
	},

    	/* Descriptor de segmento de datos*/
	(gdt_entry){ 
		(unsigned short) 0xFFFF,	//limit 0:15 	(16 bits)
		(unsigned short) 0x0000,	//base 0:15		(16 bits)
		(unsigned char) 0x00, 		//base 23:16	(7 bits)
		(unsigned char) 0x2, 		//type 			(4 bits)
		(unsigned char) 1, 			//system		(1 bit)
		(unsigned char) 0, 			//dpl			(2 bits)
		(unsigned char) 1, 			//presetn		(1 bit)
		(unsigned char) 0xF,		//limit_16_19	(4 bit)
		(unsigned char) 0,  		//avaible		(1 bit)
		(unsigned char) 0,  		//l				(1 bit)
		(unsigned char) 1,  		//d/b			(1 bit)
		(unsigned char) 1, 			//granularity	(1 bit)
		(unsigned char) 0x00 		//base_31_24	(16 bits)
	},
	
		/* Descriptor segmento de memoria de video*/
	(gdt_entry){ 
		(unsigned short) 0x0F9F,	//limit 0:15 	(16 bits)
		(unsigned short) 0x8000,	//base 0:15		(16 bits)
		(unsigned char) 0x0B, 		//base 23:16	(7 bits)
		(unsigned char) 0x2, 		//type 			(4 bits)
		(unsigned char) 1, 			//system		(1 bit)
		(unsigned char) 0, 			//dpl			(2 bits)
		(unsigned char) 1, 			//present		(1 bit)
		(unsigned char) 0x0,		//limit_16_19	(4 bit)
		(unsigned char) 0,  		//avaible		(1 bit)
		(unsigned char) 0,  		//l				(1 bit)
		(unsigned char) 1,  		//d/b			(1 bit)
		(unsigned char) 1, 			//granularity	(1 bit)
		(unsigned char) 0x00 		//base_31_24	(16 bits)
	},

		/* Descriptor de task 0*/
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
	}

};


// Definicion del GDTR
gdt_descriptor GDT_DESC = {sizeof(gdt)-1, (unsigned int)&gdt};


