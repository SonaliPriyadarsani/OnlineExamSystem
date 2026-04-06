<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<title>Admin Report</title>

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

.card-box{
background:white;
padding:25px;
border-radius:10px;
box-shadow:0 4px 12px rgba(0,0,0,0.1);
margin-bottom:30px;
}

.count-card{
background:white;
padding:20px;
border-radius:10px;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
text-align:center;
}

.count-card h2{
color:#2563eb;
}

</style>

</head>

<body>

<div class="header">
<div class="container d-flex justify-content-between">
<h4>Admin Report</h4>
<a href="admin.jsp" class="btn btn-light btn-sm">Dashboard</a>
</div>
</div>

<div class="container mt-4">

<%

try{

Connection con = DBConnection.getConnection();

/* TOTAL COUNTS */

PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM users");
ResultSet rs1 = ps1.executeQuery();
rs1.next();
int students = rs1.getInt(1);

PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM subjects");
ResultSet rs2 = ps2.executeQuery();
rs2.next();
int subjects = rs2.getInt(1);

PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM questions");
ResultSet rs3 = ps3.executeQuery();
rs3.next();
int questions = rs3.getInt(1);

PreparedStatement ps4 = con.prepareStatement("SELECT COUNT(*) FROM results");
ResultSet rs4 = ps4.executeQuery();
rs4.next();
int exams = rs4.getInt(1);

%>

<!-- COUNT CARDS -->

<div class="row mb-4">

<div class="col-md-3">
<div class="count-card">
<h2><%=students%></h2>
<p>Total Students</p>
</div>
</div>

<div class="col-md-3">
<div class="count-card">
<h2><%=subjects%></h2>
<p>Total Subjects</p>
</div>
</div>

<div class="col-md-3">
<div class="count-card">
<h2><%=questions%></h2>
<p>Total Questions</p>
</div>
</div>

<div class="col-md-3">
<div class="count-card">
<h2><%=exams%></h2>
<p>Total Exams Taken</p>
</div>
</div>

</div>

<!-- USERS TABLE -->

<div class="card-box">

<h4 class="mb-3">Student List</h4>

<table class="table table-bordered table-striped">

<tr class="table-dark">
<th>ID</th>
<th>Name</th>
<th>Email</th>
</tr>

<%

PreparedStatement ps = con.prepareStatement("SELECT * FROM users");
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
</tr>

<%
}
%>

</table>

</div>


<!-- SUBJECT TABLE -->

<div class="card-box">

<h4 class="mb-3">Subjects</h4>

<table class="table table-bordered table-striped">

<tr class="table-dark">
<th>ID</th>
<th>Subject Name</th>
</tr>

<%

PreparedStatement psSub = con.prepareStatement("SELECT * FROM subjects");
ResultSet rsSub = psSub.executeQuery();

while(rsSub.next()){
%>

<tr>
<td><%=rsSub.getInt("id")%></td>
<td><%=rsSub.getString("subject_name")%></td>
</tr>

<%
}
%>

</table>

</div>


<!-- QUESTIONS TABLE -->

<div class="card-box">

<h4 class="mb-3">Questions per Subject</h4>

<table class="table table-bordered table-striped">

<tr class="table-dark">
<th>Subject</th>
<th>Total Questions</th>
</tr>

<%

PreparedStatement psQ = con.prepareStatement(
"SELECT s.subject_name, COUNT(q.id) AS total_questions FROM subjects s LEFT JOIN questions q ON s.id=q.subject_id GROUP BY s.subject_name");

ResultSet rsQ = psQ.executeQuery();

while(rsQ.next()){
%>

<tr>
<td><%=rsQ.getString("subject_name")%></td>
<td><%=rsQ.getInt("total_questions")%></td>
</tr>

<%
}
%>

</table>

</div>


<!-- RESULTS TABLE -->

<div class="card-box">

<h4 class="mb-3">Exam Results</h4>

<table class="table table-bordered table-striped">

<tr class="table-dark">
<th>Student Name</th>
<th>Subject</th>
<th>Score</th>
</tr>

<%

PreparedStatement psR = con.prepareStatement(
"SELECT u.name, s.subject_name, r.score FROM results r JOIN users u ON r.user_id=u.id JOIN subjects s ON r.subject_id=s.id");

ResultSet rsR = psR.executeQuery();

while(rsR.next()){
%>

<tr>
<td><%=rsR.getString("name")%></td>
<td><%=rsR.getString("subject_name")%></td>
<td><%=rsR.getInt("score")%></td>
</tr>

<%
}
%>

</table>

</div>

<%

}catch(Exception e){
e.printStackTrace();
}

%>

</div>

</body>
</html>