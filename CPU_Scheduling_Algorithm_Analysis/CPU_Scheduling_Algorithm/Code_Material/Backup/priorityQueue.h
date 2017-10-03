/*
 * priorityQueue.h
 * This file has no copyright assigned and is placed in the Public Domain.
 * This file is a part of the mingw-runtime package.
 * No warranty is given; refer to the file DISCLAIMER within the package.
 *
 * Definitions of types and prototypes of functions for standard input and
 * output.
 *
 * NOTE: The file manipulation functions provided by Microsoft seem to
 * work with either slash (/) or backslash (\) as the directory separator.
 *
 */

/*All the headers include this file*/
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <algorithm>
#include <queue>
#include <cmath>
#include <pthread.h>
#include <time.h>
#include "cProcess.h"

/***
priority queue structure
***/
/***
which moves more prior processes in
running mode
***/
typedef struct priorityQueue{
    struct process **processlist;
    int numberofprocess;
}priorityQueue;


/***
functions which manages priority queue
***/
priorityQueue* createPriorityQueue(int MAX);
void EnqueueinPQ(process *p, priorityQueue *priority_queue);
process* DequeueinPQ(priorityQueue *priority_queue);
process* PeekfromPQ(priorityQueue *priority_queue);
bool isemptyPriorityQ(priorityQueue *priority_queue);


/****************** priority queue functions **********************/

// create priority queue
priorityQueue* createPriorityQueue(int MAX)
{
    int i;
    priorityQueue *pq = (priorityQueue *)malloc(sizeof(priorityQueue));
    pq->processlist = (process **)malloc(MAX*sizeof(process *));
    for(i=0;i<MAX;i++){
        pq->processlist[i] = (process *)malloc(sizeof(process));
    }
    pq->numberofprocess = 0;
}

// enqueue process in priority queue
void EnqueueinPQ(process *p, priorityQueue *priority_queue)
{
    int j,k;
    for(j=0;j<priority_queue->numberofprocess;j++)
    {
        if(p->priority >= priority_queue->processlist[j]->priority)
            break;
    }

    for(k=priority_queue->numberofprocess-1; k>=j; k--)
        priority_queue->processlist[k+1] = priority_queue->processlist[k];

    priority_queue->processlist[j] = p;
    priority_queue->numberofprocess++;
}

// dequeue from priority queue
process* DequeueinPQ(priorityQueue *priority_queue)
{
    return priority_queue->processlist[--priority_queue->numberofprocess];
}

// peek first element from priority queue
process* PeekfromPQ(priorityQueue *priority_queue)
{
    return priority_queue->processlist[priority_queue->numberofprocess-1];
}

// Check whether priority queue is empty or not
bool isemptyPriorityQ(priorityQueue *priority_queue)
{
    if(priority_queue->numberofprocess==0)
        return true;
    else
            return false;
}
/**********************************************************/
