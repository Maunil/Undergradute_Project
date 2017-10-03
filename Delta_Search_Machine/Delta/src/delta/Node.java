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
public class Node {
    Node left, right;
    int data;
    int height;
 
    /* Constructor */
    public Node()
    {
        left = null;
        right = null;
        data = 0;
        height = 0;
    }
    /* Constructor */
    public Node(int n)
    {
        left = null;
        right = null;
        data = n;
        height = 0;
    }  
    
}
