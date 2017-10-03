#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <iostream>
#include <stdbool.h>
#include <unistd.h>
#include <math.h>
#include <signal.h>
#include <fstream>
#include <sstream>
#include <string>
#include <ctime>
#include <queue>
#include "priorityQueue_Thread.h"

#define logfile "EDFlog.txt"

using namespace std;

const int N = 4;

ofstream outputfile;

pthread_mutex_t mutex1=PTHREAD_MUTEX_INITIALIZER;

// Define the function to be called when ctrl-c (SIGINT) signal is sent to process
void signal_callback_handler(int signum)
{
   outputfile<<" Interrupt is Caught :- signal "<<signum<<endl;
   // Cleanup and close up stuff here
   outputfile<<" program is terminated ";
   // Terminate program
   exit(signum);
}


int tid=0;
time_t now = '\0';
int deadline[] = {15,12,9,8};
int Execution[] = {4,3,5,2};
int Arrivaltime[] = {0,0,2,5};

queue <thread *> threadlist;

void *allocate_resources(void *argument)
{
    pthread_mutex_lock(&mutex1);
    threadlist.push(createthread(Execution[tid],deadline[tid],tid+1,deadline[tid],Arrivaltime[tid]));
    tid++;
    pthread_mutex_unlock(&mutex1);
}

void EDF_Schedular(queue <thread *> threadlist,int N)
{
    priorityQueue *priority_queue = createPriorityQueue(N);
    int timeline=0;
    double waiting=0,turnaround=0,deadlinemissed=0,idletime=0;

    while(!isemptyPriorityQ(priority_queue) || !threadlist.empty())
    {
        if(!isemptyPriorityQ(priority_queue) && !threadlist.empty())
        {
            thread *p = Dequeue(priority_queue);
            int diff = (threadlist.front()->arrTime - timeline);

            if( diff < p->exeTime)
            {
                now = time(0);
                p->exeTime-=diff;
                timeline+=diff;
                outputfile<<"ThreadID : "<<p->threadnumber<<" state : running "<<ctime(&now)<<endl;
                sleep(diff);
                now = time(0);
                outputfile<<"ThreadID : "<<p->threadnumber<<" state : ready "<<ctime(&now)<<endl;
                outputfile<<"ThreadID : "<<threadlist.front()->threadnumber<<" state : ready "<<ctime(&now)<<endl;
                Enqueue(p,priority_queue);
                Enqueue(threadlist.front(),priority_queue);
                threadlist.pop();
            }
            else
            {
                if(diff==p->exeTime)
                {
                    Enqueue(threadlist.front(),priority_queue);threadlist.pop();
                    now = time(0);
                    outputfile<<"ThreadID : "<<threadlist.front()->threadnumber<<" state : ready "<<ctime(&now)<<endl;
                }

                now = time(0);
                outputfile<<"ThreadID : "<<p->threadnumber<<" state : running "<<ctime(&now)<<endl;
                sleep(p->exeTime);

                timeline+=p->exeTime;
                turnaround += (timeline-p->arrTime);
                waiting += timeline-(p->arrTime)-(Execution[p->threadnumber-1]);

                now = time(0);
                outputfile<<"ThreadID : "<<p->threadnumber<<" state : exit "<<ctime(&now)<<endl;

                outputfile<<"P"<<p->threadnumber<<" -> "<<Execution[p->threadnumber-1]<<" -> "<<timeline-(p->arrTime)-(Execution[p->threadnumber-1])<<" -> "<<(timeline-p->arrTime)<<endl;

                if(timeline>(p->arrTime+p->deadline)){
                    deadlinemissed++;
                }
            }
        }
        else if(!threadlist.empty() && isemptyPriorityQ(priority_queue))
        {
            while(threadlist.front()->arrTime<=timeline)
            {
                now = time(0);
                outputfile<<"ThreadID : "<<threadlist.front()->threadnumber<<" state : ready "<<ctime(&now)<<endl;
                Enqueue(threadlist.front(),priority_queue);
                threadlist.pop();

                if(threadlist.empty())
                	break;
            }

            if(isemptyPriorityQ(priority_queue))
            {
                outputfile<<"CPU is idle for "<<threadlist.front()->arrTime-timeline<<" second(s)"<<endl;
                sleep(threadlist.front()->arrTime-timeline);
                idletime+=threadlist.front()->arrTime-timeline;
                timeline=threadlist.front()->arrTime;
                now = time(0);
                outputfile<<"ThreadID : "<<threadlist.front()->threadnumber<<" state : ready "<<ctime(&now)<<endl;
                Enqueue(threadlist.front(),priority_queue);
                threadlist.pop();
            }
        }
        else
        {
            thread *p = Dequeue(priority_queue);
            now = time(0);
            outputfile<<"ThreadID : "<<p->threadnumber<<" state : running "<<ctime(&now)<<endl;
            sleep(p->exeTime);

            timeline+=p->exeTime;
            turnaround += (timeline-p->arrTime);
            waiting += timeline-(p->arrTime)-(Execution[p->threadnumber-1]);

            now = time(0);
            outputfile<<"ThreadID : "<<p->threadnumber<<" state : exit "<<ctime(&now)<<endl;

            outputfile<<"P"<<p->threadnumber<<" -> "<<Execution[p->threadnumber-1]<<" -> "<<timeline-(p->arrTime)-(Execution[p->threadnumber-1])<<" -> "<<(timeline-p->arrTime)<<endl;

            if(timeline>(p->arrTime+p->deadline)){
                deadlinemissed++;
            }
        }
    }

    outputfile<<" "<<endl;
    outputfile<<"Average waiting time :- "<<waiting/N<<endl;
    outputfile<<"Average turn around time :- "<<turnaround/N<<endl;
    outputfile<<"CPU Utilization :- "<<(idletime*100)/timeline<<endl;
    outputfile<<"deadline missed :- "<<(deadlinemissed*100)/N<<endl;
}


int main(int argc, char *argv[])
{
    // Register signal and signal handler
    signal(SIGINT, signal_callback_handler);

    int i;
    pthread_t thread[N];

    ifstream inlog(logfile);

    if(inlog.good()){
        remove(logfile);
    }

    outputfile.open(logfile);
    for(i=0;i<N;i++)
    {
        int rc1 = pthread_create(&thread[0], NULL, allocate_resources, (void *) argv[1]);
        outputfile<<"Thread"<<i+1<<" created successfully."<<endl;
    }

    for(i=0;i<N;i++)
    {
        int rc1 = pthread_join(thread[0], NULL);
    }

    EDF_Schedular(threadlist,N);
    outputfile.close();

    return 0;
}
