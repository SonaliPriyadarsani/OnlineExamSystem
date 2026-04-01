package com.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.dao.DBConnection;

public class AddSubjectServlet extends HttpServlet{

protected void doPost(HttpServletRequest req,HttpServletResponse res)
throws ServletException,IOException{

String subject=req.getParameter("subject");
String link=req.getParameter("link");

try{

Connection con=DBConnection.getConnection();

PreparedStatement ps=con.prepareStatement(
"INSERT INTO subjects(subject_name,book_link) VALUES(?,?)");

ps.setString(1,subject);
ps.setString(2,link);

ps.executeUpdate();

res.sendRedirect("admin.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}