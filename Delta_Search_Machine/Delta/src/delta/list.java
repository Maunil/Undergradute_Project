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
public class list {
  
    public String item;		//variable to store data
	public list next;		//variable to store address of next node
	
	public list(String data)
	{
		item=data;
		next=null;
	}
}
