#include <iostream>
#include <stdlib.h>
#include <stdio.h>

typedef struct thread{
    int threadnumber;
    int arrTime;
    int exeTime;
    int period;
    int deadline;
}thread;

thread* createthread(int exetime,int period,int threadnum,int deadline,int arrtime)
{
    thread *p = (thread *)malloc(sizeof(thread));
    p->threadnumber = threadnum;
    p->exeTime = exetime;
    p->period = period;
    p->deadline = deadline;
    p->arrTime = arrtime;
    return p;
}

