package FacultyClass;

import java.util.*;
import java.io.*;
import java.text.*;

import PersonClass.*;
import StudentClass.*;
import AdministratorClass.*;
import queryClass.*;

public class Faculty extends Person implements Serializable, notification,query
{
    public String position;
    public String[] subjects;
    public String[] classes;
    public int year;
    private static final long serialVersionUID = 1L;

    public Faculty(String pos, String[] sub, String[] clas, String pn, char gen, String b, Date db, int i1, String e, int y)
    {
       super(pn, gen, b, db, i1,e);

       position=pos;

       subjects=new String[sub.length];

       for(int i=0;i<sub.length;i++)
       {
           subjects[i]=sub[i];
       }

       classes=new String[clas.length];

       for(int i=0;i<clas.length;i++)
       {
           classes[i]=clas[i];
       }

       year = y;

    }

    public void uploadNotice(int i) throws Exception
    {

        DateFormat dateformat=new SimpleDateFormat("dd_MM_yyyy");
		DateFormat Tateformat=new SimpleDateFormat("HH_mm_ss");
		Date date=new Date();
		dateformat.format(date);
		Tateformat.format(date);


        Scanner x=new Scanner(System.in);
        int rollNo;

        if(i==1)        //common notice
        {
            System.out.print("\nWrite(press \\ to terminate):-\n\n");

            FileWriter fw = new FileWriter("Cinbox/Notice_"+pName+"_"+dateformat.format(date)+"_"+Tateformat.format(date)+".txt");

            char ch;

            while((ch=(char)System.in.read()) !='\\')
            {
                fw.write(ch);
            }

            fw.close();

        }
        else            //personal notice
        {
            System.out.print("\nEnter the Roll Number of the Student:");
            rollNo=x.nextInt();
            File f=new File("Students/"+rollNo);
            if(!f.exists())
            {
                System.out.print("Sorry Not Found..");
            }

            else
            {
                System.out.print("\nWrite(press \\ to terminate):-\n\n");
                FileWriter fw1 = new FileWriter("Students/"+rollNo+"/Inbox/Notice_"+pName+"_"+dateformat.format(date)+"_"+Tateformat.format(date)+".txt");
                char ch;

                while((ch=(char)System.in.read()) !='\\')
                {
                    fw1.write(ch);
                }

                fw1.close();
            }
        }

    }

    public void makeExam(int i) throws Exception
    {
            DateFormat dateformat=new SimpleDateFormat("dd_MM_yyyy");
			DateFormat Timeformat=new SimpleDateFormat("HH_mm_ss");
			Date date=new Date();
			dateformat.format(date);
			Timeformat.format(date);
			String path;

			if(i==1)
                path="Administrator/";

            else
                path="Faculty/";


			String i1=dateformat.format(date);
			String i2=Timeformat.format(date);

			String  ename,dummy;

			char ch2;

			Scanner t =new Scanner (System.in);

			System.out.print("\nTo Stop Writing Paper please Enter \\:-");
			System.out.print("\nEnter Subject Name:");

			ename=t.nextLine();

			System.out.print("\nNow You can  Start to Write:-\n");
			FileWriter fOut = new FileWriter(path+id+"/"+ename+"_"+i1+"_"+i2+".txt");

			while((ch2=(char)System.in.read()) != '\\')
			{
				fOut.write(ch2);
			}

            dummy=t.next();


            fOut.close();


            Scanner d=new Scanner (System.in);

            System.out.print("\n\nNow Please Enter Its Answer Key, enter \\ to stop:-\n");

            FileWriter fOut1 = new FileWriter(path+id+"/Answers/"+ename+"_"+i1+"_"+i2+"_AnswerKey.txt");

            char ch3;

            while((ch3=(char)System.in.read())!='\\')
            {
                    fOut1.write(ch3);

            }

            fOut1.close();

    }

    public void getDetails(int i, int no) throws Exception
    {


		int yr=0;

		int year1 = Calendar.getInstance().get(Calendar.YEAR);

		int month = Calendar.getInstance().get(Calendar.MONTH);


        if(i==1)            //Administrator
        {
           String path = "Administrator/"+no;

           File f = new File(path);
           if(!f.exists())
           {
               System.out.print("\nSorry The Person Not Found...");
           }
           else
           {
                int j;

                FileInputStream fin = new FileInputStream(path+"/"+no+".bin");
                ObjectInputStream oOut = new ObjectInputStream(fin);

                Person s;

                s =(Administrator) oOut.readObject();

                System.out.print("\n\n----------------------------------------------------");

                System.out.print("\n\nThe Id is:"+s.id);

				System.out.print("\n\nFull Name:"+s.pName);

				System.out.print("\n\nGender:"+s.gender);

				System.out.print("\n\nEmail-ID:"+s.eId);

				System.out.print("\n\nBirth Date(DD/MM/YYYY):"+s.dob);

				System.out.print("\n\nAge:"+s.calcAge());

                System.out.print("\n\nBlood Group:"+s.bg);

				System.out.print("\n\nPosition:"+((Administrator)s).position);

				if(month>=7)
                    yr=(year1-(((Administrator)s).year));

                else
                    yr=(year1-(((Administrator)s).year)-1);

				System.out.print("\n\nYear Since Joined the Institute:"+yr);

				System.out.print("\n\nSubjects Taken:-");


                j = (((Administrator)s).subjects.length);

                String sub;

				for(int l=0;l<j;l++)
				{
					sub = ((Administrator)s).subjects[l];
					System.out.print("\n\n\tSubject "+(l+1)+":"+sub);
                }

				System.out.print("\n\nClasses taken by this Faculty:-");

				j= (((Administrator)s).classes.length);

				for(int l=0;l<j;l++)
				{
					sub = ((Administrator)s).classes[l];

					System.out.print("\n\n\tClass "+(l+1)+":"+sub);
				}

				System.out.print("\n\n----------------------------------------------------");
           }
        }

        else if(i==2)            //Faculty
        {
           String path = "Faculty/"+no;

           File f = new File(path);
           if(!f.exists())
           {
               System.out.print("\nSorry The Person Not Found...\n");
           }
           else
           {
                int j;

                FileInputStream fin = new FileInputStream(path+"/"+no+".bin");
                ObjectInputStream oOut = new ObjectInputStream(fin);

                Person s;

                s = (Faculty) oOut.readObject();

                System.out.print("\n\n----------------------------------------------------");

                System.out.print("\n\nThe Id is:"+s.id);

				System.out.print("\n\nFull Name:"+s.pName);

				System.out.print("\n\nGender:"+s.gender);

				System.out.print("\n\nEmail-ID:"+s.eId);

				System.out.print("\n\nBirth Date(DD/MM/YYYY):"+s.dob);

				System.out.print("\n\nAge:"+s.calcAge());

                System.out.print("\n\nBlood Group:"+s.bg);

				System.out.print("\n\nPosition:"+((Faculty)s).position);

				if(month>=7)
                    yr=(year1-(((Faculty)s).year));

                else
                    yr=(year1-(((Faculty)s).year)-1);

				System.out.print("\n\nYear Since Joined the Institute:"+yr);


				System.out.print("\n\nSubjects Taken:-");


                j = (((Faculty)s).subjects.length);

                String sub=null;

				for(int l=0;l<j;l++)
				{
					sub = ((Faculty)s).subjects[l];

					System.out.print("\n\n\tSubject "+(l+1)+":"+sub);
                }

				System.out.print("\n\nClasses taken by this Faculty:-");

				j= (((Faculty)s).classes.length);

				for(int l=0;l<j;l++)
				{
					sub = ((Faculty)s).classes[l];

					System.out.print("\n\n\tClass "+(l+1)+":"+sub);
				}

				System.out.print("\n\n----------------------------------------------------");
           }
        }

        else            //Student
        {
           String path = "Students/"+no;

           File f = new File(path);
           if(!f.exists())
           {
               System.out.print("\nSorry The Person Not Found...");
           }
           else
           {
                int j;

                FileInputStream fin = new FileInputStream(path+"/"+no+".bin");
                ObjectInputStream oOut = new ObjectInputStream(fin);

                Person s;

                s = (Student) oOut.readObject();

                System.out.print("\n\n----------------------------------------------------");

                System.out.print("\n\nThe Id is:"+s.id);

				System.out.print("\n\nFull Name:"+s.pName);

				System.out.print("\n\nGender:"+s.gender);

				System.out.print("\n\nEmail-ID:"+s.eId);

				System.out.print("\n\nBirth Date(DD/MM/YYYY):"+s.dob);

				System.out.print("\n\nAge:"+s.calcAge());

                System.out.print("\n\nBlood Group:"+s.bg);

				System.out.print("\n\nStream:"+((Student)s).stream);

				if(month>=7)
                    yr=(year1-(((Student)s).year));

                else
                    yr=(year1-(((Student)s).year)-1);

				System.out.print("\n\nYear:"+yr);

				System.out.print("\n\n----------------------------------------------------");


           }
        }
    }

    public void notification() throws Exception
    {
        int pn;

        FileReader fr = new FileReader("Faculty/"+id+"/pn.bin");

        pn=fr.read();

        fr.close();

        File f = new File("Faculty/"+id+"/Inbox");
        File [] list = f.listFiles();


        if(list.length>pn)
        {
            System.out.print("\nHello! New "+(list.length-pn)+" Messages found in your Personal Inbox..");
            pn=list.length;
        }

        FileWriter fw = new FileWriter("Faculty/"+id+"/pn.bin");

        fw.write(pn);

        fw.close();

    }

    public void showQuery() throws Exception
    {
        int input,k;
        int ch;

        Scanner x = new Scanner(System.in);

        File f = new File("Faculty/"+id+"/Inbox");
        File [] list = f.listFiles();

        if(list.length==0)
        {
                System.out.print("\nNo New Query..");
        }

        else
        {

                System.out.print("\nEnter from Below Query:-");

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

};
