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
public class Stack_methods {


	public list li;		//li is the head nodes
	public int pos;		//variable to store size of the Stack

	public Stack_methods()
	{
		li=null;
		pos=0;
	}
	
	public void push(String data)		//method to insert at front of the Stack
	{
		if(li==null)
		{
			li=new list(data);
			pos++;
		}
		
		else
		{
			list node = new list(data);
			node.next=li;
			li=node;
			pos++;
		}
		
	}
	
	public String pop()			//delete element at front
	{
	
		String take;
		
		if(li==null)
		{
			return null;
		}
		else
		{	
			take = li.item;
			
			li = li.next;
			pos--;
			
			return take;
			
		}
	}
	
	public void show()		//display the list elements
	{
		if(li==null)
		{
			System.out.print("\nThe Stack is Empty\n");
		}
		
		else
		{
			list temp=li;
			System.out.print("\nThe Stack is:-\n");
			
			while(temp!=null)
			{
				System.out.print("\n"+temp.item);
				temp=temp.next;
			}
		}
	}
	
	public int searchByElement(String data)		//performing linear search in the list
	{
		if(li==null)
		{
			return 0;
		}
		
		else
		{
			list temp=li;
			int cnt=0;
			
			while(temp!=null)
			{
				if((temp.item).equals(data))
				{
					cnt=1;
				}
				temp=temp.next;
			}
			
			if(cnt==0)
			{
				return 0;
			}
			else
			{
				return 1;
			}
		}
	}
	
	public int getStackSize()		//getting the size of the Stack
	{
		return pos;
	}    
    
}
