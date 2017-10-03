package AdministratorClass;

import java.util.*;
import java.io.*;
import java.text.*;

import PersonClass.*;
import StudentClass.*;
import FacultyClass.*;
import queryClass.*;

public class Administrator extends Faculty implements Serializable,query
{
    private static final long serialVersionUID = 1L;

    public Administrator(String pos, String[] sub, String[] clas, String pn, char gen, String b, Date db, int i1, String e,int y)
    {
        super(pos, sub, clas, pn, gen, b, db, i1,e,y);
    }

    public void addStudent() throws Exception
    {
            int NoS, Id=0, bId, yr;
			String name;
			char gen;
			Date dt;
			String blg, db;
			String str;
			String eid;

			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

			Scanner h1=new Scanner(System.in);

			System.out.print("\nEnter How Many Students to Add:");
			NoS=h1.nextInt();

            System.out.print("\nEnter the 7 digit base ID:");
            bId=h1.nextInt();

            System.out.print("\nEnter the Enrollment Year:");
            yr=h1.nextInt();
            h1.nextLine();

            System.out.print("\nEnter Stream of Students:");
            str=h1.nextLine();

            h1.nextLine();

			for(int l=1;l<=NoS;l++)
			{
				Id=bId+l;
				System.out.print("\nThe Id of Student "+l+"is:"+Id+"\n");

				System.out.print("\nEnter Full Name of Student "+l+":");
                name=h1.nextLine();

				System.out.print("\nEnter Gender Of Student(M/F) "+l+":");
				gen=h1.next().charAt(0);
				h1.nextLine();

				System.out.print("\nEnter Email-ID of Student "+l+":");
				eid = h1.next();
				h1.nextLine();

				System.out.print("\nEnter Birth Date of Student "+l+"(DD/MM/YYYY):");
				db=h1.next();

                dt = df.parse(db);

				System.out.print("\nEnter Blood Group of Student "+l+":");
				blg=h1.next();
				h1.nextLine();

				Student s = new Student(str,yr,name,gen,blg,dt,Id,eid);

				File f1=new File("Students/"+Id+"/Inbox");
				f1.mkdirs();

			    FileOutputStream fin = new FileOutputStream("Students/"+Id+"/"+Id+".bin");
				ObjectOutputStream fin1 = new ObjectOutputStream(fin);

                fin1.writeObject(s);
				fin1.flush();
				fin1.close();

				FileWriter fw = new FileWriter("Students/"+Id+"/cn.bin");
				fw.write(0);
				fw.close();

				FileWriter fw1 = new FileWriter("Students/"+Id+"/pn.bin");
				fw1.write(0);
				fw1.close();

				FileWriter fw2 = new FileWriter("Students/"+Id+"/chatn.bin");
				fw2.write('\0');
				fw2.close();


                System.out.print("\nAccount Created Successfully....");
			}
    }

    public void addFaculty() throws Exception
    {
            int NoF, Id=0, bId, yr, j;
			String name;
			char gen;
			Date dt;
			String blg, db;
			String pos;
			String eid;

			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

			Scanner h1=new Scanner(System.in);

			System.out.print("\nEnter How Many Faculty to Add:");
			NoF=h1.nextInt();

            System.out.print("\nEnter the 7 digit base ID:");
            bId=h1.nextInt();

			for(int l=1;l<=NoF;l++)
			{
				Id=bId+l;
				System.out.print("\nThe Id of Faculty "+l+"is:"+Id+"\n");
                h1.nextLine();


				System.out.print("\nEnter Full Name of Faculty "+l+":");
				name=h1.nextLine();

				System.out.print("\nEnter Gender Of Faculty(M/F) "+l+":");
				gen=h1.next().charAt(0);
				h1.nextLine();

				System.out.print("\nEnter Email-ID of Faculty "+l+":");
				eid = h1.next();
				h1.nextLine();

				System.out.print("\nEnter Birth Date of Faculty "+l+"(DD/MM/YYYY):");
				db=h1.next();

                dt = df.parse(db);

                System.out.print("\nEnter the Year of Joining:");
                yr = h1.nextInt();

				System.out.print("\nEnter Blood Group of Faculty "+l+":");
				blg=h1.next();

				h1.nextLine();


				System.out.print("\nEnter Position of Faculty "+l+":");
				pos=h1.nextLine();

				System.out.print("\nEnter number of the Subjects for this Faculty:");
				j=h1.nextInt();
				h1.nextLine();

				String[] sub=new String[j];
				for(int k=0;k<j;k++)
				{
					System.out.print("\nEnter Subject "+(k+1)+":");
					sub[k]=h1.nextLine();
					h1.nextLine();
				}

				System.out.print("\nEnter number of the Classes taken by this Faculty:");
				j=h1.nextInt();
				h1.nextLine();

				String[] cls=new String[j];
				for(int k=0;k<j;k++)
				{
					System.out.print("\nEnter Class "+(k+1)+":");
					cls[k]=h1.nextLine();
					h1.nextLine();
				}

                Faculty f = new Faculty(pos,sub,cls,name,gen,blg,dt,Id,eid,yr);

				File f1=new File("Faculty/"+Id+"/Inbox");
				f1.mkdirs();
				File f8=new File("Faculty/"+Id+"/Answers");
				f8.mkdirs();

			    FileOutputStream fin = new FileOutputStream("Faculty/"+Id+"/"+Id+".bin");
				ObjectOutputStream fin1 = new ObjectOutputStream(fin);

                fin1.writeObject(f);
				fin1.flush();
				fin1.close();

				FileWriter fw1 = new FileWriter("Faculty/"+Id+"/pn.bin");
				fw1.write(0);
				fw1.close();

				FileWriter fw2 = new FileWriter("Faculty/"+Id+"/chatn.bin");
				fw2.write('\0');
				fw2.close();


                System.out.print("\nAccount Created Successfully....");
			}
    }

    public void changeDetails(int idd) throws Exception
    {

        String path1, path2, path3,str,str1,db;
        char ch;
        Date dt;

        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

        Person po;

        Scanner x = new Scanner(System.in);

        path1 = "Administrator/"+idd;
        path2 = "Faculty/"+idd;
        path3 = "Students/"+idd;


        File f1 = new File(path1);
        File f2 = new File(path2);
        File f3 = new File(path3);

        if((!f1.exists())&&(!f2.exists())&&(!f3.exists()))
        {
            str = null;
            System.out.print("\nSorry the File was not Found..");
        }
        else if(f1.exists())
        {
            str = path1;
        }

        else if(f2.exists())
        {
            str = path2;
        }
        else
        {
           str = path3;
        }

        if(str!=null)
        {
            FileInputStream fin = new FileInputStream(str+"/"+idd+".bin");
            ObjectInputStream oIn = new ObjectInputStream(fin);

            po=(Person)oIn.readObject();

            System.out.print("\nEnter Name For Person:");
            str1 = x.nextLine();
            x.nextLine();

            po.pName = str1;

            System.out.print("\nEnter the Person's Gender(M/F):");
            ch =x.next().charAt(0);

            po.gender = ch;

            System.out.print("\nEnter the Person's Blood Group:");
            str1 = x.next();

            po.bg = str1;

            System.out.print("\nEnter the Person's Birth Date(DD/MM/YYYY):");
            db = x.next();

            dt = df.parse(db);

            po.dob = dt;

            System.out.print("\nEnter the E-Mail Id:");
            str1 = x.next();

            po.eId = str1;
            po.resetPass(str1);

            FileOutputStream fout = new FileOutputStream(str+"/"+idd+".bin");
            ObjectOutputStream oOut = new ObjectOutputStream(fout);

            oOut.writeObject(po);

            oOut.close();


        }

        System.out.print("\n\nDetails changed Successfully...");

    }

    public void notification() throws Exception
    {
        int pn;

        FileReader fr = new FileReader("Administrator/"+id+"/pn.bin");

        pn=fr.read();

        fr.close();

        File f = new File("Administrator/"+id+"/Inbox");
        File [] list = f.listFiles();


        if(list.length>pn)
        {
            System.out.print("\nHello! New "+(list.length-pn)+" Messages found in your Personal Inbox..");
            pn=list.length;
        }

        FileWriter fw = new FileWriter("Administrator/"+id+"/pn.bin");

        fw.write(pn);

        fw.close();

    }

    public void clgCalendar() throws Exception
    {
            String g,name;
			int select,i;
			char ch,ch1;

			Scanner h3=new Scanner(System.in);      //create calender folder

			System.out.print("\n1).Create Academic Calendar ");
			System.out.print("\n2).Create Exam Schedule ");
			System.out.print("\nEnter:-");

			select = h3.nextInt();

			if(select==1)
			{
						System.out.print("\nUse \\ to Stop Writing, Enter :-");
						System.out.print("\nDate        &     Occasion \n\n");

						FileWriter fin = new FileWriter("Calendar/Academic.txt");

						while((ch=(char)System.in.read())!= '\\')                   //Try to include Escape
						{
								fin.write(ch);
						}

						fin.close();

						h3.nextLine();
			}
			else
			{

						System.out.print("\nUse \\ to Stop Writing:-");

                        System.out.print("\nEnter Semester Name:");
						i=h3.nextInt();

						System.out.print("\nEnter Exam Type(All small),no space:");
						name=h3.nextLine();

						System.out.print("\nDate               Subject                Time\n");

						FileWriter fin1=new FileWriter("Calendar/TimeTable_Sem_"+i+"_"+name+".txt");

						while((ch1=(char)System.in.read()) != '\\')//Try to include Escape
						{
								fin1.write(ch1);
						}

						fin1.close();

						h3.nextLine();
			}
    }

    public void showQuery() throws Exception
    {

        int input,k;
        int ch;

        Scanner x = new Scanner(System.in);

        File f = new File("Administrator/"+id+"/Inbox");
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
