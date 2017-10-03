package chatClass;

import java.util.*;
import java.io.*;
import java.text.*;
import PersonClass.*;

public class Chat
{
    private static int id1;
    private static int id2;

    public Chat()
    {
        id1 = 0;
        id2 = 0;
    }

    public static void findChat(int idd1) throws Exception      //find the person to chat
    {
        int idd2;
        File f = new File("Online");
        Scanner x = new Scanner(System.in);

        DateFormat dateformat=new SimpleDateFormat("dd_MM_yyyy");
		DateFormat Tateformat=new SimpleDateFormat("HH_mm_ss");
		Date date=new Date();
		dateformat.format(date);
		Tateformat.format(date);


        String path1, path2, path3, path, path11, path12, path13, path_main=null;
        char[] nm;

        File[] list = f.listFiles();

        System.out.print("\nFollowing Persons are Online:-\n");

        for(int i = 0;i<list.length;i++)
        {
            System.out.print("\n"+(i+1)+").ID:"+list[i].getName()+"\n");
        }

        System.out.print("\nEnter the ID of the Person with whom You want to initiate the Chat:");
        idd2 = x.nextInt();

        id1 = idd1;
        id2 = idd2;

        path1 = "Administrator/"+id2;
        path2 = "Faculty/"+id2;
        path3 = "Students/"+id2;
		
		path11 = "Administrator/"+id1;
        path12 = "Faculty/"+id1;
        path13 = "Students/"+id1;


        File f1,f2,f3,f11,f12,f13;

        f1 = new File(path1);
        f2 = new File(path2);
        f3 = new File(path3);
		
		f11 = new File(path11);
        f12 = new File(path12);
        f13 = new File(path13);
		
		if((!f11.exists())&&(!f12.exists())&&(!f13.exists()))
        {
            System.out.print("\nSorry the Person Was not Found...");
        }

        else if(f11.exists())
        {
            path_main = path11;
        }

        else if(f12.exists())
        {
            path_main = path12;
        }

        else
        {
            path_main = path13;
		}


        if((!f1.exists())&&(!f2.exists())&&(!f3.exists()))
        {
            System.out.print("\nSorry the Person Was not Found...");
        }

        else if(f1.exists())
        {
            path = path1+"/chatn.bin";
            nm = (path_main+" wanted to do chat with you on "+dateformat.format(date)+"_"+Tateformat.format(date)+"\n").toCharArray();

            FileWriter fw = new FileWriter(path, true);

            for(int j = 0;j<nm.length;j++)
            {
                fw.write(nm[j]);
            }

            fw.close();
        }

        else if(f2.exists())
        {
            path = path2+"/chatn.bin";

            nm = (path_main+" wanted to do chat with you on "+dateformat.format(date)+"_"+Tateformat.format(date)+"\n").toCharArray();

            FileWriter fw = new FileWriter(path, true);

            for(int j = 0;j<nm.length;j++)
            {
                fw.write(nm[j]);
            }

            fw.close();
        }

        else
        {
            path = path3+"/chatn.bin";

            nm = (path_main+" wanted to do chat with you on "+dateformat.format(date)+"_"+Tateformat.format(date)+"\n").toCharArray();

            FileWriter fw = new FileWriter(path, true);

            for(int j = 0;j<nm.length;j++)
            {
                fw.write(nm[j]);
            }

            fw.close();
        }


    }

    public static void createChat(String str) throws Exception          //create chat if file not found
    {
        FileWriter fw = new FileWriter("Chats/"+str);
        fw.close();
    }

    public static String existsChat(String str1, String str2)             //check that chat file is already present or not returns file name if it exists
    {
        File f = new File("Chats");

        File[] list = f.listFiles();
		
		String file;
		
		for(int i = 0;i<list.length;i++)
        {
			file = list[i].getName();
			
			if((file.equals(str1))||(file.equals(str2)))
			{
				return file;
			}
		}
		
		return null;

       /* 
	   String st1, st2, substr1, substr2,file;					//Other Logic but too complicated

        st1 = Integer.toString(id1);
        st2 = Integer.toString(id2);

        for(int i = 0;i<list.length;i++)
        {
            file = list[i].getName();
            substr1 = file.substring(0, file.lastIndexOf('_'));
            substr2 = file.substring((file.lastIndexOf('_')+1), file.lastIndexOf('.'));

            if((st1.equals(substr1)&&st2.equals(substr2))||(st2.equals(substr1)&&st1.equals(substr2)))
            {
                return file;
            }
        }

        return null; 
		*/

    }

    public static void checkChat (String id) throws Exception       //shows who wants to chat with you
    {
        int ch;
        FileReader fr = new FileReader(id+"/chatn.bin");

		System.out.print("\n\n");
		
        while((ch=fr.read()) != -1)
		{
			System.out.print((char)ch);
		}

        fr.close();

        FileWriter fw = new FileWriter(id+"/chatn.bin");
        fw.close();

    }

    public static void doChat(String str, String name) throws Exception         //to do chatting
    {
        FileWriter fw = new FileWriter("Chats/"+str, true);

        Scanner x = new Scanner(System.in);
		
		DateFormat dateformat=new SimpleDateFormat("dd_MM_yyyy");
		DateFormat Tateformat=new SimpleDateFormat("HH_mm_ss");
		Date date;
		
        int i = 1, ch, cnt=0;
        char []ch1;
        char ch2;
		
		FileReader fr = new FileReader("Chats/"+str);
			
        while((ch=fr.read()) != -1)
        {
			System.out.print((char)ch);
        }
			
		fr.close();
			

        while(i==1)
        {	
		
			date = new Date();
			
			ch1 = (name+", on Date:"+dateformat.format(date)+"_and Time:"+Tateformat.format(date)+":\n\n").toCharArray();
			 
			cnt = 0;
		
			System.out.print("-----------------------------------------------------------");

			System.out.print("\nChat Started, press \\ to finish writing:-\n\n");

            while((ch2=(char)System.in.read()) !='\\')
            {
                if(cnt == 0)
                {
                    for(int l=0;l<ch1.length;l++)
                    {
                        fw.write(ch1[l]);
                    }
                    cnt++;
                }
                fw.write(ch2);
            }
			
			fw.flush();
			
			FileReader fr1 = new FileReader("Chats/"+str);
			
            while((ch=fr1.read()) != -1)
            {
                System.out.print((char)ch);
            }
			
			fr1.close();
			
			System.out.print("\nDo you want to continue?(1/2):");
            i = x.nextInt();
			
			FileReader fr2 = new FileReader("Chats/"+str);
			
            while((ch=fr2.read()) != -1)
            {
                System.out.print((char)ch);
            }
			
			fr2.close();
			
			
        }

        fw.close();

    }

    public static void combine(Person p) throws Exception            //combining class left
    {
        String str1, str2, take, name;
		int id;
		
		name = p.pName;
		id = p.id;
		
		findChat(id);
		
		System.out.print("\nId1:"+id1);
		System.out.print("\nId2:"+id2);
		
		str1 = id1+"_"+id2+".txt";
		str2 = id2+"_"+id1+".txt";
		
		take = existsChat(str1, str2);
		
		if(take == null)
		{
			createChat(str1);
			take = str1;
		}
		
		doChat(take, name);
		
    }


};
