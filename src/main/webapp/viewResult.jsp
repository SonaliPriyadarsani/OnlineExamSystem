<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<title>My Results</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f4f6fb;
font-family:Arial;
}

.header{
background:#1e293b;
color:white;
padding:15px;
}

.container-box{
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 12px rgba(0,0,0,0.1);
margin-top:40px;
}

.score{
font-weight:bold;
color:#2563eb;
}

</style>

</head>

<body>

<div class="header">

<div class="container d-flex justify-content-between">

<h4>Online Examination System</h4>

<a href="student.jsp" class="btn btn-light btn-sm">Dashboard</a>

</div>

</div>


<div class="container">

<div class="container-box">

<h3 class="text-center mb-4">My Exam Results</h3>

<table class="table table-bordered table-striped text-center">

<tr class="table-dark">

<th>Subject</th>
<th>Score</th>
<th>Total Questions</th>
<th>Exam Date</th>

</tr>

<%

Integer user_id = (Integer)session.getAttribute("user_id");

if(user_id == null){
response.sendRedirect("login.jsp");
}

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(

"SELECT r.score, r.total_questions, r.exam_date, s.subject_name FROM results r JOIN subjects s ON r.subject_id = s.id WHERE r.user_id=?"

);

ps.setInt(1,user_id);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>

<td><%=rs.getString("subject_name")%></td>

<td class="score">

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

<br>

<div class="text-center">

<a href="student.jsp" class="btn btn-primary">
Back to Dashboard
</a>

</div>

</div>

</div>

</body>
</html>