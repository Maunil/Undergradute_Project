/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delta;

import java.io.Serializable;
import delta.object;

/**
 *
 * @author Shreyash
 */
public class Priorityqueue implements Serializable
{
        public object [] A;
	public int size;
	public int count;
	
	public Priorityqueue(int v,int c)
	{
            size = v;
            A = new object[v+1];
            count = c;
	}
	
	public void Enqueue(String n)
	{
            A[0] =  new object(null);
            
            if(size<count)
            {
                Dequeue();
            }

            int check=0;
            for(int i=1;i<count;i++)
            {
                if(n.equals(A[i].a))
                {
                    A[i].counter--;
                    check++;
                    break;
                }
            }

            if(check==0)
            {			
                    A[count] = new object(n);
                    heap(count);
                    count++;
            }	
	}
	
	public String Dequeue()
	{
            String s=null;
            if(count==1)
            {
                s ="-1";
            }
            else
            {
                sort();
                count--;
                s = A[count].a;
            }
            return s;
	}
        
	
	public void sort()
	{
            object u=null;
            int y = count-1;
            while(y!=1 && A[1].counter<A[y].counter)
            {			
                u = A[1];
                A[1] = A[y];
                A[y] = u;
                y--;
                heap((y/2)+1);
            }
	}
	
	public void heap(int i)
	{		
            if(A[i].counter<A[i/2].counter && i!=1)
            {
                object h=null;
                h = A[i];
                A[i] = A[i/2];
                A[i/2]= h;
                heap(i/2);
            }
	}
        
        public object[] GetArray()
        {
            return A;
        }
        
        public void Display()
        {
            for(int i=1;i<count;i++)
            {
                System.out.println(A[i].a+"-"+A[i].counter);
            }
        }
        
        public int GetCounter()
        {
            return count;
        }
}
