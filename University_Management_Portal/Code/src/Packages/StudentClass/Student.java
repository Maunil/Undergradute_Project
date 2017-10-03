package StudentClass;

import java.util.*;
import java.io.*;
import java.text.*;

import PersonClass.*;
import queryClass.*;
import MyException.*;

public class Student extends Person implements Serializable, notification
{
    public String stream;
    public int year;
    private static final long serialVersionUID = 1L;

    public Student(String str,int yr, String pn, char gen, String b, Date db, int i1, String e )
    {
        super(pn, gen, b, db, i1,e);

        stream=str;
        year=yr;
    }

    public void showThisDetails()
    {
        int yr=0;

		int year1 = Calendar.getInstance().get(Calendar.YEAR);

		int month = Calendar.getInstance().get(Calendar.MONTH);

        System.out.print("\n\n----------------------------------------------------");

        System.out.print("\n\nThe Id is:"+id);

        System.out.print("\n\nFull Name:"+pName);

        System.out.print("\n\nGender:"+gender);

        System.out.print("\n\nEmail-ID:"+eId);

        System.out.print("\n\nBirth Date(DD/MM/YYYY):"+dob);

        System.out.print("\n\nAge:"+calcAge());

        System.out.print("\n\nBlood Group:"+bg);

        System.out.print("\n\nStream:"+stream);

        if(month>=7)
            yr=(year1-year);

        else
            yr=(year1-(year)-1);

        System.out.print("\n\nYear:"+yr);

        System.out.print("\n\n----------------------------------------------------");

    }

    public void showCalendar() throws Exception
    {
        Scanner h3  = new Scanner(System.in);

        int ch,ch1;
        int i,select;
        String name;

        System.out.print("\n1).See Academic Calendar ");
        System.out.print("\n2).See Exam Schedule ");
        System.out.print("\nEnter:-");

        select = h3.nextInt();

        if(select==1)
        {
                System.out.print("\nDate        &     Occasion \n\n");

                FileReader fin = new FileReader("Calendar/Academic.txt");

                while((ch=fin.read())!=-1)
                {
                    System.out.print((char)ch);
                }


                fin.close();

                h3.nextLine();
        }

        else
        {

                System.out.print("\nUse \\ to Stop Writing:-");

                System.out.print("\nEnter Semester Name:");
                i=h3.nextInt();

                System.out.print("\nEnter Exam Type(All Small),no Space:");
                name=h3.nextLine();

                System.out.print("\nDate               Subject                Time\n");

                FileReader fin1=new FileReader("Calendar/TimeTable_Sem_"+i+"_"+name+".txt");

                while((ch=fin1.read())!=-1)
                {
                    System.out.print((char)ch);
                }


                fin1.close();

                h3.nextLine();
        }
    }

    public void query() throws Exception
    {
        Scanner x = new Scanner(System.in);
        int id;


        DateFormat dateformat=new SimpleDateFormat("dd_MM_yyyy");
		DateFormat Tateformat=new SimpleDateFormat("HH_mm_ss");
		Date date=new Date();
		dateformat.format(date);
		Tateformat.format(date);


        System.out.print("\nEnter the Faculty Id for the Query:");
        id=x.nextInt();


        File f=new File("Faculty/"+id);
        File f1=new File("Administrator/"+id);

		try
		{
        if(!f.exists()&& !f1.exists())
        {
           throw new MyException();
        }

        else if(f.exists())
        {
            System.out.print("\nWrite(press \\ to terminate):-\n\n");
            FileWriter fw = new FileWriter("Faculty/"+id+"/Inbox/Query_"+pName+"_"+dateformat.format(date)+"_"+Tateformat.format(date)+".txt");
            char ch;

            while((ch=(char)System.in.read()) !='\\')
            {
                fw.write(ch);
            }


            fw.close();

        }

        else
        {
            System.out.print("\nWrite(press \\ to terminate):-\n\n");
            FileWriter fw = new FileWriter("Administrator/"+id+"/Inbox/Query_"+pName+"_"+dateformat.format(date)+"_"+Tateformat.format(date)+".txt");
            char ch;

            while((ch=(char)System.in.read()) !='\\')
            {
                fw.write(ch);
            }

            fw.close();

        }
		}
		catch(MyException e)
		{
			e.show();
		}
    }

    public void readNotice() throws Exception
    {
        int input,k;
        int ch;

        Scanner x = new Scanner(System.in);
        System.out.print("\nEnter From Below:-");
        System.out.print("\n1).Read from Common Inbox");
        System.out.print("\n2).Read From Personal Inbox");
        input = x.nextInt();

        if(input==1)
        {
             File f = new File("Cinbox");
             File [] list = f.listFiles();

              if(list.length==0)
              {
                     System.out.print("\nNo New Notice..");
              }

              else
              {

                     System.out.print("\nEnter from Below Notice:-");

                     for(int i=0;i<list.length;i++)
                     {
                        System.out.print("\n"+(i+1)+")."+list[i]+"\n");
                     }
                     System.out.print("\nEnter:");
                     k = x.nextInt();

                     FileReader fin = new FileReader(list[k-1]);

                     while((ch=fin.read())!=-1)
                     {
                        System.out.print((char)ch);
                     }

                     fin.close();
              }


         }

         else
         {
             File f = new File("Students/"+id+"/Inbox");
             File [] list = f.listFiles();


             if(list.length==0)
             {
                System.out.print("\nNo New Notice..");
             }

             else
             {
                 System.out.print("\nEnter from Below Notice:-");

                 for(int i=0;i<list.length;i++)
                 {
                    System.out.print("\n"+(i+1)+")."+list[i]+"\n");
                 }

                 System.out.print("\nEnter:");
                 k = x.nextInt();

                 FileReader fin = new FileReader(list[k-1]);

                 while((ch=fin.read())!=-1)
                 {
                    System.out.print((char)ch);
                 }

                 fin.close();
             }

         }
    }

    public void notification() throws Exception
    {
        int cn,pn;

        FileReader fr = new FileReader("Students/"+id+"/cn.bin");
        FileReader fr1 = new FileReader("Students/"+id+"/pn.bin");

        cn=fr.read();
        pn=fr1.read();

        fr.close();
        fr1.close();

        File f = new File("Students/"+id+"/Inbox");
        File [] list = f.listFiles();

        File f1 = new File("Cinbox");
        File [] list1 = f1.listFiles();


        if(list.length>pn)
        {
            System.out.print("\nHello! New "+(list.length-pn)+" Messages found in your Personal Inbox..");
            pn=list.length;
        }

        if(list1.length>cn)
        {
            System.out.print("\nHello! New "+(list1.length-cn)+" Notice found..");
            cn=list1.length;
        }

        FileWriter fw = new FileWriter("Students/"+id+"/cn.bin");
        FileWriter fw1 = new FileWriter("Students/"+id+"/pn.bin");

        fw.write(cn);
        fw1.write(pn);

        fw.close();
        fw1.close();


    }



};
