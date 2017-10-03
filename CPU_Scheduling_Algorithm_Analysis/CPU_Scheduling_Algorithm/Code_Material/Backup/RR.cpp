#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <algorithm>
#include <queue>
#include "priorityQueue.h"

using namespace std;


/***** Round Robin Scheduling
preemptive scheduling algorithm
*****/
void RR(queue <process *> processlist,int N,int T)
{
    queue <process *> readyqueue; // ready queue
    int quantum = 6;
    cout<<"<------------------- RR ------------------->"<<endl<<" "<<endl;
    cout<<"No -> Execution time -> Waiting -> Turn around time"<<endl;
    double waitingtime=0;
    double turnarroundtime=0;
    double idletime=0;
    double throughput=0;
    double timeline=0;
    while(!processlist.empty() || !readyqueue.empty())
    {
        if(!processlist.empty() && !readyqueue.empty())
        {
            process *p = readyqueue.front();
            readyqueue.pop();

			if(p->exeTime<=quantum)
            {
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
                p->exeTime-=quantum;
                timeline+=quantum;
				readyqueue.push(p);
            }
        }
        else if(!processlist.empty() && readyqueue.empty())
        {
            while(processlist.front()->arrTime<=timeline)
            {
                readyqueue.push(processlist.front());
                processlist.pop();

                if(processlist.empty())
                    break;
            }

            if(readyqueue.empty())
            {
                idletime+=processlist.front()->arrTime-timeline;
                cout<<"IDLE -> "<<endl;
                timeline=processlist.front()->arrTime;
                readyqueue.push(processlist.front());
                processlist.pop();
            }
        }
        else
        {
            process *p = readyqueue.front();
            readyqueue.pop();

            if(p->exeTime<=quantum)
            {
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
                p->exeTime-=quantum;
                timeline+=quantum;
                readyqueue.push(p);
            }
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
        processlist.push(createProcess(i+1,a,e,0,d,e));
    }

    RR(processlist,N,t);
    return 0;
}
