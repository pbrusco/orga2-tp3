#include "tss.h"

#define TSS_COUNT 3

//Arreglo de TSSs 
tss tsss[TSS_COUNT] = {
	
	// Tarea Nula
	(tss) {
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short)  0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0
	},
	
	// Tarea 1 - Pintor
	(tss) {
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short)  0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0
	},

	// Tarea 2 - Traductor
	(tss) {
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short)  0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0
	}


};
