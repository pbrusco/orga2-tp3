

//definicion del scheduler


struct tarea{

	tarea* proxima;
	unsigned int gdtEntryNum;

};


struct sched {

	tarea* inicial = NULL;
	int tareasPendientes = 0;
};
