package PersonClass;

import java.util.*;
import java.io.*;
import java.text.*;
import MyException.*;

public abstract class Person implements Serializable
{
    public String pName;
    public char gender;
    public String bg;
    public Date dob;
    public int id;
    public String eId;
    private String password;
    private static final long serialVersionUID = 1L;

    public Person(String pn, char gen , String b, Date db,int i,String e)
    {
        pName=pn;
        gender=gen;
        bg=b;
        dob=db;
        id=i;
        eId=e;
        password=eId;
    }

    public int calcAge()
    {
        int age=0;

		int year = Calendar.getInstance().get(Calendar.YEAR);

		int month = Calendar.getInstance().get(Calendar.MONTH);


		if(month>=dob.getMonth())
			age=(year-(1900+dob.getYear()));

		else
			age=(year-(1900+dob.getYear())-1);

        return age;
    }

    public void setBackgroundDetails(int i) throws Exception
	{
		char ch3;
		String str;

		if(i==1)
        {
            str="Faculty";
        }

        else if(i==2)
        {
            str="Students";
        }
        else
        {
            str="Administrator";
        }

        System.out.print("\nTo Stop Enter \\:-"+"\nStart Writing:-\n");

		FileWriter g=new FileWriter(str+"/"+id+"/"+"bd.txt");

		while((ch3=(char)System.in.read())!='\\')
		{
				g.write(ch3);
		}
        g.close();
	}

	public void getBackgroundDetails(int i, int Id) throws Exception
	{
		int ch3;
		String str;

		try
		{
		if(i==1)
        {
            str="Faculty";
        }

        else if(i==2)
        {
            str="Students";
        }
        else
        {
            str="Administrator";
        }

        System.out.print("\nThe Details Are:-\n");

        String path = str+"/"+id;

        File f = new File(path);
        File f1 = new File(path+"/"+"bd.txt");

        if(f.exists()&&f1.exists())
        {
            FileReader fIn = new FileReader(str+"/"+id+"/"+"bd.txt");


            while((ch3=fIn.read()) != -1)
            {
                System.out.print((char)ch3);
            }
            fIn.close();

        }
        else if(!f.exists())
        {
			throw new MyException();
        }
        else
        {
            System.out.print("\nIts Background details does not exists...");
        }
		}
		catch(MyException e)
		{
			e.show();
		}
	}


    public void resetPass(String pass)
    {
        password=pass;
        System.out.print("\nPassword Reseted Successfully...");
    }

    public String getPass()
    {
        return password;
    }

};
