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
public class object implements Serializable
{
        public String a;
	public int counter;

        public object(String name)
	{
		a = name;
		counter = 0;
	}
        
        public String GetFileNameString()
        {
            return a;
        }
}
