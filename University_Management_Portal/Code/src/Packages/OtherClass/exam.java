package OtherClass;

import java.util.*;
import java.io.*;
import java.text.*;
import java.awt.Desktop;
import java.net.URI;

public class exam extends TimerTask
{
	public String test;
	public int iid;
	public String strr;

	public exam()
	{
	    test = null;
	    iid = 0;
	    strr = null;
	}

	public void show (String str, int id)
	{
        try
        {
            Scanner x = new Scanner(System.in);
            int k;

            File f = new File(str+id);
            File[] list = f.listFiles();

            System.out.print("\nEnter From List Below:-");
            for(int i=0;i<list.length;i++)
            {
                if(list[i].getName().endsWith(".txt"))
                {
                    System.out.print("\n"+(i+1)+")."+list[i].getName());
                }
            }
            System.out.print("\nEnter:-");
            k = x.nextInt();

            test=list[k-1].getName();

            iid = id;

            readFile(list[k-1]);
        }
        catch(Exception e)
        {
            System.out.print("Sorry some Exception Occured..."+e);
        }
	}
    public void run()
	{
		try
		{
		    String str;
		    int i;

		    Scanner x = new Scanner(System.in);

		    System.out.print("\nEnter The Faculty's Id:");
            i = x.nextInt();

            iid=i;

		    File f = new File("Administrator/"+i);
		    File f1 = new File("Faculty/"+i);

		    if((!f.exists())&&(!f1.exists()))
            {
                System.out.print("\nSorry the Account not Found...");
            }
            else if(f.exists())
            {
                str = "Administrator/";
                strr = str;
            }

            else if(f1.exists())
            {
                str = "Faculty/";
                strr = str;
            }

			show(strr,i);

			System.out.println("\n\nStart Answering write answer without any space or enter, write \\ to stop:-\n");
			{
                writeFile("tempAns.txt");
			}
		}
		catch(Exception e)
		{
				System.out.print("Exception Occur");
		}

        completeTask();
    }

	public static void readFile(File filename) throws Exception
	{
		int ch;
		FileReader fIn = new FileReader(filename);

		while((ch=fIn.read()) != -1)
		{
			System.out.print((char)ch);
		}

		fIn.close();
	}
	public static void writeFile(String fileName) throws Exception
	{
        FileWriter fOut = new FileWriter(fileName);

        char ch;
        int ch1;
        while((ch=(char)System.in.read()) != '\\' )
        {

            fOut.write(ch);
        }

        fOut.close();
	}

    private void completeTask()
	{
        try
		{

           Thread.sleep(20000);
		}
		catch (InterruptedException e)
		{
				e.printStackTrace();
		}
    }

    public void Method()                        //this is a main Method of this class
	{
        TimerTask timerTask = new exam();
                                                            //running timer task as daemon thread
        Timer timer = new Timer(true);
        timer.scheduleAtFixedRate(timerTask, 0, 20000);
                                                            //cancel after sometime
        try
		{
            Thread.sleep(20000);
        }
		catch (InterruptedException e)
		{
            e.printStackTrace();
        }

        test = ((exam)timerTask).test;
        strr = ((exam)timerTask).strr;
        iid = ((exam)timerTask).iid;

        timer.cancel();

        System.out.println("\nExam Over...");

        try
		{
            Thread.sleep(3000);
        }

        catch (InterruptedException e)
		{
            e.printStackTrace();
        }

        finally
        {
           marks();
        }
    }
	public void marks()
	{
		String line1 = null;
		String line  =  null;

		File fin = new File("tempAns.txt");     //This you should change according to  your Program

		if(!fin.exists())
		{
			System.out.println("Sorry your Answer Key Not Found");
		}

		else
		{


            try
            {

                FileReader f = new FileReader("tempAns.txt");//stud
                Scanner in = new Scanner(f);

                String t1 = test;

                t1 = t1.substring(0, t1.lastIndexOf('.'));


                FileReader ans = new FileReader(strr+iid+"/Answers/"+t1+"_AnswerKey.txt"); //inbuilt

                int l1=0,l=0;
                Scanner inp = new Scanner(ans);

                while(in.hasNextLine())
                {
                   line1= inp.nextLine();
                   line =in.nextLine();

                   if(line1.equals(line))
                   {
                        l1++;
                   }
                   else
                        l++;
                }
                System.out.println("\n Your Marks is:"+l1);

				ans.close();
				f.close();

                File f9 = new File("tempAns.txt");
                f9.delete();

            }
            catch(Exception e)
            {
                System.out.println("Error occur"+e);
            }
        }
	}
};
