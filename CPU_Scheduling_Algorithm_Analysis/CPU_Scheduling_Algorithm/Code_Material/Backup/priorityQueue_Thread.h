#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include "cThread.h"

typedef struct priorityQueue{
    struct thread **threadlist;
    int numberofthread;
}priorityQueue;


priorityQueue* createPriorityQueue(int MAX){
    int i;
    priorityQueue *pq = (priorityQueue *)malloc(sizeof(priorityQueue));
    pq->threadlist = (thread **)malloc(MAX*sizeof(thread *));
    for(i=0;i<MAX;i++){
        pq->threadlist[i] = (thread *)malloc(sizeof(thread));
    }
    pq->numberofthread = 0;
}

void Enqueue(thread *p, priorityQueue *priority_queue)
{
    int j,k;
    for(j=0;j<priority_queue->numberofthread;j++)
    {
        if(p->period >= priority_queue->threadlist[j]->period)
            break;
    }

    for(k=priority_queue->numberofthread-1; k>=j; k--)
        priority_queue->threadlist[k+1] = priority_queue->threadlist[k];

    priority_queue->threadlist[j] = p;
    priority_queue->numberofthread++;
}

thread* Dequeue(priorityQueue *priority_queue)
{
    return priority_queue->threadlist[--priority_queue->numberofthread];
}

thread* PeekMin(priorityQueue *priority_queue)
{
    return priority_queue->threadlist[priority_queue->numberofthread-1];
}

bool isemptyPriorityQ(priorityQueue *priority_queue)
{
    if(priority_queue->numberofthread==0)
        return true;
    else
        return false;
}
