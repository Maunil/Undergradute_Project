#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <algorithm>
#include <queue>
#include "priorityQueue.h"

using namespace std;

/***** First come first serve
Preemptive algorithm
*****/

void FCFS(queue <process *> processlist,int N,int T)
{
    queue <process *> readyqueue; // ready queue
    cout<<"<------------------- FCFS ------------------->"<<endl<<" "<<endl;
    cout<<"No -> Execution time -> Waiting -> Turn around time"<<endl;
    double waitingtime=0;
    double turnarroundtime=0;
    double idletime=0;
    double throughput=0;
    double timeline=0;

    while(!processlist.empty() || !readyqueue.empty())
    {
        // process are available but ready queue is empty
        if(!processlist.empty() && readyqueue.empty())
        {
            while(processlist.front()->arrTime==timeline)
            {
                readyqueue.push(processlist.front());
                processlist.pop();

                if(processlist.empty())
                    break;
            }

            if(readyqueue.empty())// if still ready queue is empty then at this t
            {
                idletime+=processlist.front()->arrTime-timeline;// add idle time
                cout<<"IDLE -> "<<endl;
                timeline=processlist.front()->arrTime; // shift timeline to new process arrival time
                readyqueue.push(processlist.front());// put new process in queue
                processlist.pop();// remove process from list
            }
        }
        else if(!processlist.empty() && !readyqueue.empty())
        {
            process *p = readyqueue.front();
            readyqueue.pop();

            int diff = processlist.front()->arrTime - timeline;
            if(p->exeTime<=diff)
            {
                if(p->exeTime==diff)
                {
                    readyqueue.push(processlist.front());processlist.pop();
                }

                timeline+=p->exeTime;
                turnarroundtime+=(timeline-(p->arrTime));
                waitingtime+=(timeline-(p->arrTime)-(p->exeC));

                if(timeline+p->exeTime<=T){
                    throughput++;
                }

                cout<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
            }
            else
            {
                p->exeTime-=diff;
                timeline+=diff;
				readyqueue.push(p);
				readyqueue.push(processlist.front());processlist.pop();
            }
        }
        else
        {
            process *p = readyqueue.front();
            readyqueue.pop();

            timeline+=p->exeTime;
            turnarroundtime+=(timeline-(p->arrTime));
            waitingtime+=(timeline-(p->arrTime)-(p->exeC));

            if(timeline+p->exeTime<=T){
                throughput++;
            }

            cout<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
        }
    }

    cout<<" "<<endl;
    cout<<"Average waiting time :- "<<waitingtime/N<<endl;
    cout<<"Average turn around time :- "<<turnarroundtime/N<<endl;
    cout<<"CPU Utilization :- "<<((timeline-idletime)*100)/timeline<<"%"<<endl;
    cout<<"Throughput percentage :- "<<(throughput*100)/N<<"%"<<endl;
}

int main()
{
    queue <process *> processlist;
    int N,i,t=50;
    printf("How many processes you want to enter :- ");
    scanf("%d",&N);

    for(i=0;i<N;i++)
    {
        int a,e,d,pr;
        cin>>a>>e>>d>>pr;
        processlist.push(createProcess(i+1,a,e,0,d,d));
    }

    FCFS(processlist,N,t);
    return 0;
}
