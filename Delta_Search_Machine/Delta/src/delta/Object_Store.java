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
public class Object_Store {
    
    public String a;
	public int value;

        public Object_Store(String n,int Value)
	{
            a=n;
            value=Value;
	}
        
        public String GetFileNameString()
        {
            return a;
        }
        public int GetValue()
        {
            return value;
        }
        
        public void StoreName(String n)
        {
            a=n;
        }
        
        public void Storevalue(int Value)
        {
            value=Value;
        }
}
