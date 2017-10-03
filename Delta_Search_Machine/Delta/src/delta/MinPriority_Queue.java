/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delta;

/**
 *
 * @author Shreyash
 */
public class MinPriority_Queue {

    
	private Object_Store []Number;
	private int MAXI;
	private int size;
	
	public MinPriority_Queue(){}
	
	public MinPriority_Queue(int maxi)
	{
		size=0;
		MAXI=maxi;
		Number=new Object_Store[maxi+1];
	}
	
	public void Enqueue(String Item,int value)
	{
        Object_Store g= new Object_Store(Item,value);
		if(size<MAXI)
		{
                    if(size==0)
                    {
                        size++;
                        Number[size]=g;
                    }
                    else
                    {
                        size++;
                        if(value>=Number[size/2].GetValue())
                        {
                            Number[size]=g;
                        }
                        else
                        {
                            int i=size;
                            Number[i]=g;
                            while(true)
                            {
                                if(i==1){break;}
                                if(Number[i].GetValue()<Number[i/2].GetValue())
                                {
                                    Object_Store Temp=Number[i/2];
                                    Number[i/2]=Number[i];
                                    Number[i]=Temp;
                                    i=i/2;								
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }					
                    }			
		}
		else
		{
			System.out.println("\nMIN PRIORITY QUEUE IS FULL.\n");
		}
	}
	
	public Object_Store Dequeue()
	{
            System.out.println("\ndequeue\n");
            Object_Store RemovedElement = null;
            if(size!=0)
            {
                RemovedElement=Number[1];
                System.out.println(RemovedElement.GetFileNameString()+" - "+RemovedElement.GetValue());
                Number[1]=Number[size];
                size--;int i=1;

                while(true)
                {
                        if(i>=size){break;}
                        if(2*i+1<=size)
                        {
                                if(Number[2*i].GetValue()<Number[i].GetValue())
                                {
                                        Object_Store Swapper=Number[i];
                                        Number[i]=Number[2*i];
                                        Number[2*i]=Swapper;
                                }					
                                if(Number[2*i+1].GetValue()<Number[i].GetValue())
                                {
                                        Object_Store Swapper=Number[i];
                                        Number[i]=Number[2*i+1];
                                        Number[2*i+1]=Swapper;
                                }
                                i=i*2;
                        }
                        else if(2*i<=size)
                        {
                                if(Number[2*i].GetValue()<Number[i].GetValue())
                                {
                                        Object_Store Swapper=Number[i];
                                        Number[i]=Number[2*i];
                                        Number[2*i]=Swapper;
                                        i=i*2;
                                }
                                else
                                {
                                        break;
                                }						
                        }
                        else
                        {
                                break;
                        }
                }

            }
            System.out.println("Removed Element :- "+RemovedElement.GetFileNameString()+" - "+RemovedElement.GetValue());
            return RemovedElement;
	}
	
	public void Display()
	{
		for(int i=1;i<=size;i++)
		{
			System.out.println(Number[i].GetFileNameString());
		}
	}
	
	public Object_Store Peek()
	{
		if(size==0)
		{
			return null;
		}
		else
		{
			return Number[1];			
		}
	}
}
