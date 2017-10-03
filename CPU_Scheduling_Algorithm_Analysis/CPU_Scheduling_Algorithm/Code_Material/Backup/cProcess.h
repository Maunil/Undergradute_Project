/*
 * cProcess.h
 */

#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <algorithm>
#include <queue>
#include <cmath>
#include <pthread.h>
#include <time.h>

/***
process structure
***/
typedef struct process
{
    int processnumber;
    int arrTime;
    int exeTime;
    int period;
    int deadline;
    int priority;
	int exeC;
}process;

process* createProcess(int num,int arrtime,int exetime,int period,int deadline,int priority)
{
    process *p = (process *)malloc(sizeof(process));
    p->processnumber = num;
    p->arrTime = arrtime;
    p->exeTime = exetime;
    p->period = period;
    p->deadline = deadline;
    p->priority = priority;
	p->exeC = exetime;
    return p;
}
