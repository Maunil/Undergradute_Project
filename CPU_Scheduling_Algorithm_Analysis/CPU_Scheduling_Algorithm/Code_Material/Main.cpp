#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <algorithm>
#include <queue>
#include <cmath>
#include <pthread.h>
#include <time.h>
#include <signal.h>
#include <fstream>
#include <sstream>
#include <string>
#include "priorityQueue.h"

#define logfile "log.txt"

using namespace std;

ofstream outputfile;

// Define the function to be called when ctrl-c (SIGINT) signal is sent to process
void signal_callback_handler(int signum)
{
   outputfile<<" Interrupt is Caught :- signal "<<signum<<endl;
   outputfile<<" Interrupt is disabled. "<<endl;
   cout<<" Interrupt is Caught :- signal "<<signum<<endl;
   cout<<" Interrupt is disabled. "<<endl;
}

/*********************** Different scheduling algorithms ********************/

/*
waiting time = time for which process has to wait
turn around time = waiting + execution time
idletime = time for which cpu is idle (no process available for execution)
throughput = processes which are completed for per given time
*/

/***** First come first serve
Preemptive algorithm
*****/

void FCFS(queue <process *> processlist,int N,int T)
{
    queue <process *> readyqueue; // ready queue
    outputfile<<"<------------------- FCFS ------------------->"<<endl<<" "<<endl;
    outputfile<<"No -> Execution time -> Waiting -> Turn around time"<<endl;
    double waitingtime=0;
    double turnarroundtime=0;
    double idletime=0;
    double deadlinemissed=0;
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
                outputfile<<"IDLE -> "<<endl;
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

                if(timeline>(p->deadline+p->arrTime))
                    deadlinemissed++;

                if(timeline<=T)
                    throughput++;

                outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
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

            if(timeline>(p->deadline+p->arrTime))
                deadlinemissed++;

            if(timeline<=T)
                throughput++;

            outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
        }
    }

    outputfile<<" "<<endl;
    outputfile<<"Average waiting time :- "<<waitingtime/N<<endl;
    outputfile<<"Average turn around time :- "<<turnarroundtime/N<<endl;
    outputfile<<"CPU Utilization :- "<<((timeline-idletime)*100)/timeline<<"%"<<endl;
    outputfile<<"Throughput percentage :- "<<(throughput*100)/N<<"%"<<endl;
    outputfile<<"Deadline missed :- "<<(deadlinemissed*100)/N<<"%"<<endl;
}

/*****
Shortest Remaining Next
Preemptive algorithm
*****/
void SRF(queue <process *> processlist,int N,int T)
{
    priorityQueue *readyqueue = createPriorityQueue(N);
    outputfile<<"<------------------- SJF ------------------->"<<endl<<" "<<endl;
    outputfile<<"No -> Execution time -> Waiting -> Turn around time"<<endl;
    double waitingtime=0;
    double turnarroundtime=0;
    double idletime=0;
    double throughput=0;
    double timeline=0;
    double deadlinemissed=0;

    while(!processlist.empty() || !isemptyPriorityQ(readyqueue))
    {
        // process are available but ready queue is empty
        if(!processlist.empty() && isemptyPriorityQ(readyqueue))
        {
            while(processlist.front()->arrTime==timeline)
            {
                EnqueueinPQ(processlist.front(),readyqueue);
                processlist.pop();

                if(processlist.empty())
                    break;
            }

            if(isemptyPriorityQ(readyqueue))// if still ready queue is empty then at this t
            {
                idletime+=processlist.front()->arrTime-timeline;// add idle time
                outputfile<<"IDLE -> "<<endl;
                timeline=processlist.front()->arrTime; // shift timeline to new process arrival time
                EnqueueinPQ(processlist.front(),readyqueue);// put new process in queue
                processlist.pop();// remove process from list
            }
        }
        else if(!processlist.empty() && !isemptyPriorityQ(readyqueue))
        {
            process *p = DequeueinPQ(readyqueue);

            int diff = processlist.front()->arrTime - timeline;
            if(p->exeTime<=diff)
            {
                if(p->exeTime==diff)
                {
                    EnqueueinPQ(processlist.front(),readyqueue);processlist.pop();
                }

                timeline+=p->exeTime;
                turnarroundtime+=(timeline-(p->arrTime));
                waitingtime+=(timeline-(p->arrTime)-(p->exeC));

                if(timeline>(p->deadline+p->arrTime))
                    deadlinemissed++;

                if(timeline<=T)
                    throughput++;

                outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
            }
            else
            {
                p->exeTime-=diff;
                timeline+=diff;
				EnqueueinPQ(p,readyqueue);
				EnqueueinPQ(processlist.front(),readyqueue);processlist.pop();
            }
        }
        else
        {
            process *p = DequeueinPQ(readyqueue);

            timeline+=p->exeTime;
            turnarroundtime+=(timeline-(p->arrTime));
            waitingtime+=(timeline-(p->arrTime)-(p->exeC));

            if(timeline>(p->deadline+p->arrTime))
                deadlinemissed++;

            if(timeline<=T)
                throughput++;

            outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
        }
    }

    outputfile<<" "<<endl;
    outputfile<<"Average waiting time :- "<<waitingtime/N<<endl;
    outputfile<<"Average turn around time :- "<<turnarroundtime/N<<endl;
    outputfile<<"CPU Utilization :- "<<((timeline-idletime)*100)/timeline<<"%"<<endl;
    outputfile<<"Throughput percentage :- "<<(throughput*100)/N<<"%"<<endl;
    outputfile<<"Deadline missed :- "<<(deadlinemissed*100)/N<<"%"<<endl;
}

/***** Round Robin Scheduling
preemptive scheduling algorithm
*****/
void RR(queue <process *> processlist,int N,int T)
{
    queue <process *> readyqueue; // ready queue
    int quantum = 6;
    outputfile<<"<------------------- RR ------------------->"<<endl<<" "<<endl;
    outputfile<<"No -> Execution time -> Waiting -> Turn around time"<<endl;
    double waitingtime=0;
    double turnarroundtime=0;
    double idletime=0;
    double throughput=0;
    double deadlinemissed=0;
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

                if(timeline>(p->deadline+p->arrTime))
                    deadlinemissed++;

                if(timeline<=T)
                    throughput++;

                outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
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
                outputfile<<"IDLE -> "<<endl;
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

                if(timeline>(p->deadline+p->arrTime))
                    deadlinemissed++;

                if(timeline<=T)
                    throughput++;

                outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
            }
            else
            {
                p->exeTime-=quantum;
                timeline+=quantum;
                readyqueue.push(p);
            }
        }
    }

    outputfile<<" "<<endl;
    outputfile<<"Average waiting time :- "<<waitingtime/N<<endl;
    outputfile<<"Average turn around time :- "<<turnarroundtime/N<<endl;
    outputfile<<"CPU Utilization :- "<<((timeline-idletime)*100)/timeline<<"%"<<endl;
    outputfile<<"Throughput percentage :- "<<(throughput*100)/N<<"%"<<endl;
    outputfile<<"Deadline missed :- "<<(deadlinemissed*100)/N<<"%"<<endl;
}

/***
Priority Based scheduling algorithm
preemptive algorithm
***/
void PS(queue <process *> processlist,int N,int T)
{
    priorityQueue *readyqueue = createPriorityQueue(N);
    outputfile<<"<------------------- PS ------------------->"<<endl<<" "<<endl;
    outputfile<<"No -> Execution time -> Waiting -> Turn around time"<<endl;
    double waitingtime=0;
    double turnarroundtime=0;
    double idletime=0;
    double throughput=0;
    double deadlinemissed=0;
    double timeline=0;

    while(!processlist.empty() || !isemptyPriorityQ(readyqueue))
    {
        // process are available but ready queue is empty
        if(!processlist.empty() && isemptyPriorityQ(readyqueue))
        {
            while(processlist.front()->arrTime==timeline)
            {
                EnqueueinPQ(processlist.front(),readyqueue);
                processlist.pop();

                if(processlist.empty())
                    break;
            }

            if(isemptyPriorityQ(readyqueue))// if still ready queue is empty then at this t
            {
                idletime+=processlist.front()->arrTime-timeline;// add idle time
                outputfile<<"IDLE -> "<<endl;
                timeline=processlist.front()->arrTime; // shift timeline to new process arrival time
                EnqueueinPQ(processlist.front(),readyqueue);// put new process in queue
                processlist.pop();// remove process from list
            }
        }
        else if(!processlist.empty() && !isemptyPriorityQ(readyqueue))
        {
            process *p = DequeueinPQ(readyqueue);

            int diff = processlist.front()->arrTime - timeline;
            if(p->exeTime<=diff)
            {
                if(p->exeTime==diff)
                {
                    EnqueueinPQ(processlist.front(),readyqueue);processlist.pop();
                }

                timeline+=p->exeTime;
                turnarroundtime+=(timeline-(p->arrTime));
                waitingtime+=(timeline-(p->arrTime)-(p->exeC));

                if(timeline>(p->deadline+p->arrTime))
                    deadlinemissed++;

                if(timeline<=T)
                    throughput++;

                outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
            }
            else
            {
                p->exeTime-=diff;
                timeline+=diff;
				EnqueueinPQ(p,readyqueue);
				EnqueueinPQ(processlist.front(),readyqueue);processlist.pop();
            }
        }
        else
        {
            process *p = DequeueinPQ(readyqueue);

            timeline+=p->exeTime;
            turnarroundtime+=(timeline-(p->arrTime));
            waitingtime+=(timeline-(p->arrTime)-(p->exeC));

            if(timeline>(p->deadline+p->arrTime))
                deadlinemissed++;

            if(timeline<=T)
                throughput++;

            outputfile<<p->processnumber<<" -> "<<p->exeC<<" -> "<<timeline-(p->arrTime)-(p->exeC)<<" -> "<<timeline-(p->arrTime)<<endl;
        }
    }

    outputfile<<" "<<endl;
    outputfile<<"Average waiting time :- "<<waitingtime/N<<endl;
    outputfile<<"Average turn around time :- "<<turnarroundtime/N<<endl;
    outputfile<<"CPU Utilization :- "<<((timeline-idletime)*100)/timeline<<"%"<<endl;
    outputfile<<"Throughput percentage :- "<<(throughput*100)/N<<"%"<<endl;
    outputfile<<"Deadline missed :- "<<(deadlinemissed*100)/N<<"%"<<endl;
}

int main()
{
    // Register signal and signal handler
    signal(SIGINT, signal_callback_handler);

    int t=50,N;
    int a,e,d,pr;

    cout<<"How many processes you want to enter [10-60]:- ";
    cin>>N;

    queue <process*> processlist_fcfs;
    queue <process*> processlist_srf;
    queue <process*> processlist_rr;
    queue <process*> processlist_ps;

    ostringstream convert;
	convert << N;
	int p_id = rand() % 30 + 1985;
	string file = "Files/WithArrival/"+convert.str()+".txt";
    ifstream infile(file.c_str());
    ifstream inlog(logfile);

    if(inlog.good()){
        remove(logfile);
    }

    while(infile >> a >> e >> d >> pr)
    {
        processlist_fcfs.push(createProcess(p_id,a,e,0,d,pr));
        processlist_srf.push(createProcess(p_id,a,e,0,d,e));
        processlist_rr.push(createProcess(p_id,a,e,0,d,pr));
        processlist_ps.push(createProcess(p_id,a,e,0,d,pr));
		p_id++;
    }

    outputfile.open(logfile);
    FCFS(processlist_fcfs,N,t);
    SRF(processlist_srf,N,t);
    RR(processlist_rr,N,t);
    PS(processlist_ps,N,t);
    outputfile.close();
    return 0;
}
