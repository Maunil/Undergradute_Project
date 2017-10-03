package OtherClass;

import java.util.*;
import java.io.*;
import java.text.*;
import java.awt.Desktop;
import java.net.URI;


public class browser
{

    public void show() throws Exception
	{

		String url ="oop.html";

        if (Desktop.isDesktopSupported())
		{
            // Windows
			File htmlFile = new File(url);
			Desktop.getDesktop().browse(htmlFile.toURI());

        }
        else
		{
            // Ubuntu
            Runtime runtime = Runtime.getRuntime();

            runtime.exec("/usr/bin/firefox -new-window " + url);
        }
   }
};
