//  usage:
//    gcc -o thread threads.c
//    ./thread time
//    time is the number of seconds

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define NUM_THREADS 3

void *other_func(void *argument)
{
	printf("P\n");
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUM_THREADS];
	int thread_args[NUM_THREADS];
	int rc1, rc2, rc3, i;

	/* setup all arguments */
	for (i=0; i<NUM_THREADS; ++i)
		{
			thread_args[i] = i;
			printf("In main: creating thread %d\n", i);
		}
	/* create all threads */
	rc1 = pthread_create(&threads[0], NULL, other_func, (void *) argv[1]);
	rc2 = pthread_create(&threads[1], NULL, other_func, (void *) &thread_args[1]);
	rc3 = pthread_create(&threads[2], NULL, other_func, (void *) &thread_args[2]);
	/* wait for all threads to complete */
	rc1 = pthread_join(threads[0], NULL);
	rc2 = pthread_join(threads[1], NULL);
	rc3 = pthread_join(threads[2], NULL);
	/*for (i=0; i<NUM_THREADS; ++i)
		{
			thread_args[i] = i;
			printf("In main: destroing thread %d\n", i);
		}*/
	exit(EXIT_SUCCESS);
}
