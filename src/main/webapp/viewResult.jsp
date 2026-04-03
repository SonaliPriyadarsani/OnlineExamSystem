<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>
<html>
<head>
<title>My Results</title>
</head>

<body>

<h2>My Exam Results</h2>

<table border="1" cellpadding="10">

<tr>
<th>Subject</th>
<th>Score</th>
<th>Total Questions</th>
<th>Exam Date</th>
</tr>

<%

String student_name = (String)session.getAttribute("username");

if(student_name == null){
response.sendRedirect("login.jsp");
}
try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT r.score, r.total_questions, r.exam_date, s.subject_name FROM results r JOIN subjects s ON r.subject_id = s.id WHERE r.student_name=?");

ps.setString(1,student_name);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>

<td><%=rs.getString("subject_name")%></td>

<td>
<%=rs.getInt("score")%> / <%=rs.getInt("total_questions")%>
</td>

<td><%=rs.getInt("total_questions")%></td>

<td><%=rs.getString("exam_date")%></td>

</tr>

<%
}

}catch(Exception e){
e.printStackTrace();
}

%>

</table>

</body>
</html>