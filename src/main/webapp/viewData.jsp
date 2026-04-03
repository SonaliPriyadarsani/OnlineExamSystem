<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<html>
<head>
<title>Admin Dashboard</title>
</head>

<body>

<h2>Admin Dashboard</h2>

<%

int students = 0;
int subjects = 0;
int questions = 0;
int exams = 0;

try{

Connection con = DBConnection.getConnection();

/* Total Students */

PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM users");
ResultSet rs1 = ps1.executeQuery();

if(rs1.next()){
students = rs1.getInt(1);
}

/* Total Subjects */

PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM subjects");
ResultSet rs2 = ps2.executeQuery();

if(rs2.next()){
subjects = rs2.getInt(1);
}

/* Total Questions */

PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM questions");
ResultSet rs3 = ps3.executeQuery();

if(rs3.next()){
questions = rs3.getInt(1);
}

/* Total Exams */

PreparedStatement ps4 = con.prepareStatement("SELECT COUNT(*) FROM results");
ResultSet rs4 = ps4.executeQuery();

if(rs4.next()){
exams = rs4.getInt(1);
}

}catch(Exception e){
e.printStackTrace();
}

%>

<p>Total Students : <b><%=students%></b></p>

<p>Total Subjects : <b><%=subjects%></b></p>

<p>Total Questions : <b><%=questions%></b></p>

<p>Total Exams Taken : <b><%=exams%></b></p>

</body>
</html>