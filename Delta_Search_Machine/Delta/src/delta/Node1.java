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
public class Node1 implements Serializable{
    public String Data;
	public Node1 Next;
	
	public Node1(String data)
	{
		Data=data;
		Next=null;
	}
	
	public String GetData()
	{
		return Data;
	}
}
