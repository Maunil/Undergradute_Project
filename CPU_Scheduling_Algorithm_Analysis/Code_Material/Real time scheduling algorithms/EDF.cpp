#include <stdio.h>
#include <stdlib.h>
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
#include "priorityQueue.h"

#define logfile "EDFlog.txt"

using namespace std;

const int N = 4;

ofstream outputfile;

// Define the function to be called when ctrl-c (SIGINT) signal is sent to process
void signal_callback_handler(int signum)
{
   outputfile<<" Interrupt is Caught :- signal "<<signum<<endl;
   // Cleanup and close up stuff here
   outputfile<<" Interrupt is disabled. "<<endl;
   // Terminate program
   cout<<" Interrupt is Caught :- signal "<<signum<<endl;
   // Cleanup and close up stuff here
   cout<<" Interrupt is disabled. "<<endl;
}


time_t now = '\0';
int deadline[] = {15,12,9,8};
int Execution[] = {4,3,5,2};
int Arrivaltime[] = {0,0,2,5};

queue <process *> processlist;

void EDF_Schedular(queue <process *> processlist,int N)
{
    priorityQueue *priority_queue = createPriorityQueue(N);
    int timeline=0;
    double waiting=0,turnaround=0,deadlinemissed=0,idletime=0;

    while(!isemptyPriorityQ(priority_queue) || !processlist.empty())
    {
        if(!isemptyPriorityQ(priority_queue) && !processlist.empty())
        {
            process *p = DequeueinPQ(priority_queue);
            int diff = (processlist.front()->arrTime - timeline);

            if( diff < p->exeTime)
            {
                now = time(0);
                p->exeTime-=diff;
                timeline+=diff;
                outputfile<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
                sleep(diff);
                now = time(0);
                outputfile<<"ProcessID : "<<p->processnumber<<" state : ready "<<ctime(&now)<<endl;
                outputfile<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" state : ready "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;

                EnqueueinPQ(p,priority_queue);
                EnqueueinPQ(processlist.front(),priority_queue);
                processlist.pop();
            }
            else
            {
                if(diff==p->exeTime)
                {
                    EnqueueinPQ(processlist.front(),priority_queue);processlist.pop();
                    now = time(0);
                    outputfile<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;
                    cout<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;
                }

                now = time(0);
                outputfile<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
                sleep(p->exeTime);

                timeline+=p->exeTime;
                turnaround += (timeline-p->arrTime);
                waiting += timeline-(p->arrTime)-(Execution[p->processnumber-1]);

                now = time(0);
                outputfile<<"ProcessID : "<<p->processnumber<<" state : exit "<<ctime(&now)<<endl;
                outputfile<<"ProcessID : "<<p->processnumber<<" -> "<<Execution[p->processnumber-1]<<" -> "<<timeline-(p->arrTime)-(Execution[p->processnumber-1])<<" -> "<<(timeline-p->arrTime)<<endl;

                cout<<"ProcessID : "<<p->processnumber<<" state : exit "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" -> "<<Execution[p->processnumber-1]<<" -> "<<timeline-(p->arrTime)-(Execution[p->processnumber-1])<<" -> "<<(timeline-p->arrTime)<<endl;

                if(timeline>(p->arrTime+p->deadline)){
                    deadlinemissed++;
                }
            }
        }
        else if(!processlist.empty() && isemptyPriorityQ(priority_queue))
        {
            while(processlist.front()->arrTime<=timeline)
            {
                now = time(0);
                outputfile<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;
                EnqueueinPQ(processlist.front(),priority_queue);
                processlist.pop();

                if(processlist.empty())
                	break;
            }

            if(isemptyPriorityQ(priority_queue))
            {
                outputfile<<"CPU is idle for "<<processlist.front()->arrTime-timeline<<" second(s)"<<endl;
                cout<<"CPU is idle for "<<processlist.front()->arrTime-timeline<<" second(s)"<<endl;

                sleep(processlist.front()->arrTime-timeline);
                idletime+=processlist.front()->arrTime-timeline;
                timeline=processlist.front()->arrTime;
                now = time(0);

                outputfile<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<processlist.front()->processnumber<<" state : ready "<<ctime(&now)<<endl;
                EnqueueinPQ(processlist.front(),priority_queue);
                processlist.pop();
            }
        }
        else
        {
            process *p = DequeueinPQ(priority_queue);
            now = time(0);
            outputfile<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
            cout<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
            sleep(p->exeTime);

            timeline+=p->exeTime;
            turnaround += (timeline-p->arrTime);
            waiting += timeline-(p->arrTime)-(Execution[p->processnumber-1]);

            now = time(0);
            outputfile<<"ProcessID : "<<p->processnumber<<" state : exit "<<ctime(&now)<<endl;
            outputfile<<"ProcessID : "<<p->processnumber<<" -> "<<Execution[p->processnumber-1]<<" -> "<<timeline-(p->arrTime)-(Execution[p->processnumber-1])<<" -> "<<(timeline-p->arrTime)<<endl;

            cout<<"ProcessID : "<<p->processnumber<<" state : exit "<<ctime(&now)<<endl;
            cout<<"ProcessID : "<<p->processnumber<<" -> "<<Execution[p->processnumber-1]<<" -> "<<timeline-(p->arrTime)-(Execution[p->processnumber-1])<<" -> "<<(timeline-p->arrTime)<<endl;

            if(timeline>(p->arrTime+p->deadline)){
                deadlinemissed++;
            }
        }
    }

    outputfile<<" "<<endl;
    outputfile<<"Average waiting time :- "<<waiting/N<<endl;
    outputfile<<"Average turn around time :- "<<turnaround/N<<endl;
    outputfile<<"CPU Utilization :- "<<((timeline-idletime)*100)/timeline<<endl;
    outputfile<<"Deadline missed :- "<<(deadlinemissed*100)/N<<endl;

    cout<<" "<<endl;
    cout<<"Average waiting time :- "<<waiting/N<<endl;
    cout<<"Average turn around time :- "<<turnaround/N<<endl;
    cout<<"CPU Utilization :- "<<((timeline-idletime)*100)/timeline<<endl;
    cout<<"Deadline missed :- "<<(deadlinemissed*100)/N<<endl;
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
        processlist.push(createProcess(i+1,Arrivaltime[i],Execution[i],deadline[i],deadline[i],deadline[i]));
        outputfile<<"Process "<<i+1<<" created successfully."<<endl;
        cout<<"Process "<<i+1<<" created successfully."<<endl;
    }

    outputfile<<" "<<endl;
    EDF_Schedular(processlist,N);
    outputfile.close();

    return 0;
}
