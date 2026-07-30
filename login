import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class Login extends JFrame  implements ActionListener
{
    JTextField  tfusername,tfpassword;
    Login()
    {
        getContentPane().setBackground(Color.WHITE);
        setLayout(null);

////////////////////////////          Username           ///////////////////////////////////////////
        JLabel username=new JLabel("Username");
        username.setBounds(40,80,200,30);
        username.setFont(new Font("Serif",Font.PLAIN,25));
        add(username);

        tfusername=new JTextField();
        tfusername.setBounds(250,80,200,30);
        add(tfusername);

///////////////////////////////////      Password        ///////////////////////////////////////////////
        JLabel password=new JLabel("Password");
        password.setBounds(40,140,200,30);
        password.setFont(new Font("Serif",Font.PLAIN,25));
        add(password);

        tfpassword=new JTextField();
        tfpassword.setBounds(250,140,200,30);
        add(tfpassword);

        /////////////////////////////////////         Button            ///////////////////////////
        JButton login=new JButton("LOGIN");
        login.setBounds(160,230,150,30);
        login.setBackground(Color.BLACK);
        login.setForeground(Color.WHITE);
        login.addActionListener(this);
        add(login);


        //////////////////////////////////////           For Image  ///////////////////////////////////////////
        ImageIcon i1=new ImageIcon(ClassLoader.getSystemResource("icons/second.jpg"));
        Image i2=i1.getImage().getScaledInstance(250,250,Image.SCALE_DEFAULT);
        ImageIcon i3=new ImageIcon(i2);
        JLabel image=new JLabel(i3);
        image.setBounds(490,10,250,250);
        add(image);


        setSize(800,400);
        setLocation(400,200);
        setVisible(true);
    }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////         This is the code for the database    //////////////////////////////////


    public void actionPerformed(ActionEvent ae)
    {
        try
        {
            String username=tfusername.getText();
            String password=tfpassword.getText();
            Conn c=new Conn();
            String query= "select * from login where username ='"+username+"'and password = '"+password+"'";

            ResultSet rs=c.s.executeQuery(query);
            if(rs.next())
            {
                setVisible(false);
                System.out.println("Hello, World!");
            }
            else
            {
                JOptionPane.showMessageDialog(null,"Invalid username or password");
                setVisible(false);
            }


        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }


    public static void main(String args[])
    {
        new Login();
    }
}
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

import java.sql.*;
public class Conn

{
    /////////////////  There are 5 steps of jbdc connectivity  //////////////////////
    ///////////  1   Register the Driver Class         ///////////////////////////
    ///////////  2   Creating the connection String   ////////////////////////////
    ////////////  3   Creating the Statement           ////////////////////////////
    ///////////  4   Executing mysql queries          ////////////////////////////
    ///////////  5   Close the connections            ////////////////////////////
    Connection c;
    Statement s;

    public Conn()
    {  /////////////////////////////////         This is the code for create the connection    //////////////////////////
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");                                                                 ///////////////////     First Step
            c= DriverManager.getConnection("jdbc:mysql://localhost:3306/simplelogin","root","@aashish0802"); ////////     Second Step
            s=c.createStatement();                                                                                              ///////////////////      Third Step
        }
        catch (Exception ae)
        {
            ae.printStackTrace();
        }
    }
}
/////////////////////////////////////////////////////////////////////////////////////

create database simplelogin;

show databases;
use simplelogin;

create table login(username varchar(20),password varchar(20));

insert into login  values('aashish','1234');
