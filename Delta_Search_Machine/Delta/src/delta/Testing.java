/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delta;

import java.io.FileReader;
import java.io.IOException;
import javax.swing.JFrame;
import static javax.swing.JFrame.EXIT_ON_CLOSE;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

/**
 *
 * @author Shreyash
 */
public class Testing extends JFrame
{
  public Testing(String str)
  {
    setLocation(300,200);
    JTextArea ta = new JTextArea(20,40);
    
    getContentPane().add(new JScrollPane(ta));
    pack();
    try
    {
        ta.read(new FileReader(str),null);
    }
    catch(Exception ioe)
    {
    
    }
  }

}
