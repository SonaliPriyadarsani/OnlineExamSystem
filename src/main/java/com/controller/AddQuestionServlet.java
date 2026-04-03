package com.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.dao.DBConnection;

public class AddQuestionServlet extends HttpServlet{

protected void doPost(HttpServletRequest req,HttpServletResponse res)
throws ServletException,IOException{

int subject_id=Integer.parseInt(req.getParameter("subject_id"));

String question=req.getParameter("question");
String op1=req.getParameter("op1");
String op2=req.getParameter("op2");
String op3=req.getParameter("op3");
String op4=req.getParameter("op4");
String correct=req.getParameter("correct");

try{

Connection con=DBConnection.getConnection();

PreparedStatement ps=con.prepareStatement(
"INSERT INTO questions(subject_id,question,option1,option2,option3,option4,correct_answer) VALUES(?,?,?,?,?,?,?)");

ps.setInt(1,subject_id);
ps.setString(2,question);
ps.setString(3,op1);
ps.setString(4,op2);
ps.setString(5,op3);
ps.setString(6,op4);
ps.setString(7,correct);

ps.executeUpdate();


res.sendRedirect("addQuestion.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}