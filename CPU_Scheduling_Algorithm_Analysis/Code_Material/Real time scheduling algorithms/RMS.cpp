#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <stdbool.h>
#include <unistd.h>
#include <math.h>
#include <signal.h>
#include <fstream>
#include <sstream>
#include <ctime>
#include <string>
#include "priorityQueue.h"

#define logfile "RMSlog.txt"

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
   // Terminate program
  // exit(signum);
}

int GCD=0,i=0,timeline=0;
time_t now = '\0';
int Period[] = {10,5,30,15};
int Execution[] = {2,1,5,2};
process *Array[N];

int gcd(int a, int b)
{
  if (b == 0)
    return a;

  return gcd(b, a%b);
}

int lcm(int *a, int n)
{
  int res = 1, i;
  for (i = 0; i < n; i++)
  {
    res = res*a[i]/gcd(res, a[i]);
  }

  return res;
}

void RMS(int GCD,priorityQueue *priority_queue)
{
    int i=GCD;bool status = false;
    while(i>0)
    {
        if(!isemptyPriorityQ(priority_queue))
        {
            process *p = DequeueinPQ(priority_queue);
            if(p->exeTime<=i)
            {
                i-=p->exeTime;
                timeline+=p->exeTime;

                now = time(0);
                outputfile<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;

                sleep(p->exeTime);

                now = time(0);
                outputfile<<"ProcessID : "<<p->processnumber<<" state : exit "<<ctime(&now)<<endl;
                outputfile<<"ProcessID : "<<p->processnumber<<" -> "<<timeline-(Execution[p->processnumber-1])<<" -> "<<timeline<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" state : exit "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" -> "<<timeline-(Execution[p->processnumber-1])<<" -> "<<timeline<<endl;
            }
            else
            {
                p->exeTime-=i;
                timeline+=i;

                now = time(0);
                outputfile<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" state : running "<<ctime(&now)<<endl;

                sleep(i);

                now = time(0);
                outputfile<<"ProcessID : "<<p->processnumber<<" state : ready "<<ctime(&now)<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" state : ready "<<ctime(&now)<<endl;

                EnqueueinPQ(p,priority_queue);
                outputfile<<"ProcessID : "<<p->processnumber<<" -> "<<timeline-(Execution[p->processnumber-1])<<" -> "<<timeline<<endl;
                cout<<"ProcessID : "<<p->processnumber<<" -> "<<timeline-(Execution[p->processnumber-1])<<" -> "<<timeline<<endl;
                break;
            }
        }
        else
        {
            status=true;
            break;
        }
    }

    if(status)
    {
        outputfile<<"\nCPU IS IDLE FOR "<<i<<" SECOND(s)"<<endl;
        cout<<"\nCPU IS IDLE FOR "<<i<<" SECOND(s)"<<endl;
        timeline+=i;
        sleep(i);
    }
}

void AddthreadInTimeLine(process **Arr,int N,priorityQueue *priority_queue,int Period)
{
    outputfile<<" "<<endl;
    cout<<" "<<endl;
    int i;
    for(i=0;i<N;i++)
    {
        if(Period%Arr[i]->period==0)
        {
            EnqueueinPQ(Arr[i],priority_queue);
            now = time(0);
            outputfile<<"ProcessID : "<<Arr[i]->processnumber<<" state : ready "<<ctime(&now)<<endl;
            cout<<"ProcessID : "<<Arr[i]->processnumber<<" state : ready "<<ctime(&now)<<endl;
        }
    }
    outputfile<<" "<<endl;
    cout<<" "<<endl;
}

bool RMSException(int *Exe,int *Period,int N)
{
    int i;double sum=0;
    for(i=0;i<N;i++)
    {
        sum = sum + ((double)Exe[i]/(double)Period[i]);
    }

    double condition = N*(pow(2,((double)1/N))-1);

    printf("\nCPU Utilization :-%f Theoritical :- %f\n",sum,condition);

    if(sum<condition)
    {
        return true;
    }
    else
    {
        return false;
    }
}

int main(int argc, char *argv[])
{
	// Register signal and signal handler
    signal(SIGINT, signal_callback_handler);

    int i;
    priorityQueue *priority_queue = createPriorityQueue(N);

    ifstream inlog(logfile);

    if(inlog.good()){
        remove(logfile);
    }

    outputfile.open(logfile);
    for(i=0;i<N;i++)
    {
        GCD = gcd(Period[i],GCD);
        Array[i]=createProcess(i+1,0,Execution[i],Period[i],Period[i],Period[i]);
        outputfile<<"Process "<<i+1<<" created successfully."<<endl;
        cout<<"Process "<<i+1<<" created successfully."<<endl;
    }

    if(RMSException(Execution,Period,N))
    {
        outputfile<<"Process No. -> Waiting time -> Turn around time"<<endl;
        cout<<"Process No. -> Waiting time -> Turn around time"<<endl;
        int LCM = lcm(Period,N);
        for(i=0;i<LCM/GCD;i++)
        {
            AddthreadInTimeLine(Array,N,priority_queue,i*GCD);
            RMS(GCD,priority_queue);
        }

        outputfile<<"One cycle ends and again  it will be repeated."<<endl;
        cout<<"One cycle ends and again  it will be repeated."<<endl;
    }
    else
    {
        printf("\nRMS is not applicable.\n");
    }
    outputfile.close();

    return 0;
}
