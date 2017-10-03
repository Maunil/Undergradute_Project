/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delta;

import java.io.Serializable;

/**
 *
 * @author Shreyash
 */
public class Queue_LinkedList implements Serializable
{

        private Node1 Head;
	private int SIZE;//dynamically changing
	private int MAX;//define by user

	//contractor
	public Queue_LinkedList(int max)
	{
		Head=null;
		SIZE = 0;
		MAX=max;
	}
	
	//General function for add data at any position
	public void Enqueue(String str)
	{
            if(Checker(str))
            {
                return;
            }

            Node1 n=new Node1(str);
            if(Head==null)
            {
                    Head=n;
                    SIZE++;
                    return;
            }

            if(SIZE==MAX)
            {
                    Dequeue();
                    Enqueue(str);
            }
            else
            {
                    Node1 Dummy=Head;
                    while(Dummy.Next!=null)
                    {
                            Dummy=Dummy.Next;
                    }
                    Dummy.Next=n;
            }
            SIZE++;
	}
	
	
	//General function for deleting data from any position
	public void Dequeue()
	{
            if(SIZE==0 && Head==null)
            {
                    return;
            }

            Head=Head.Next;
            SIZE--;
	}

        public boolean Checker(String c)
        {
            Node1 Dummy=Head;int i=0;boolean v=false;
            while(Dummy!=null)
            {
                if(c.equals(Dummy.GetData()))
                {
                    v=true;
                    break;
                }
                else
                {
                    Dummy=Dummy.Next;
                }
            }
            return v;
        }
	//Display function
	public String[] GetHistory()
	{
                String[] array = new String[MAX];
		Node1 Dummy=Head;int i=0;
		while(true)
		{
			if(Dummy!=null)
			{
				array[i] = Dummy.Data;
				Dummy=Dummy.Next;i++;
			}
			else
			{
				break;
			}
		}
                return array;
	}    
    
}
