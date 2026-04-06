<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Exam Result</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
font-family:'Poppins',sans-serif;
background:#f4f6fb;
}

/* Navbar */

.navbar{
background:#1e293b;
}

.navbar-brand{
color:white;
font-weight:600;
}

/* Result Card */

.result-card{
max-width:600px;
margin:auto;
margin-top:60px;
background:white;
padding:40px;
border-radius:12px;
box-shadow:0 5px 20px rgba(0,0,0,0.1);
text-align:center;
}

/* Score */

.score{
font-size:40px;
font-weight:600;
color:#2563eb;
margin:20px 0;
}

/* Stats */

.stat-box{
background:#f1f5f9;
padding:15px;
border-radius:10px;
margin:10px;
}

/* Button */

.btn-dashboard{
background:#2563eb;
color:white;
padding:10px 20px;
border-radius:8px;
text-decoration:none;
}

.btn-dashboard:hover{
background:#1d4ed8;
}

</style>

</head>

<body>

<nav class="navbar navbar-expand-lg">
<div class="container">
<a class="navbar-brand">Online Exam</a>
</div>
</nav>

<div class="result-card">

<h2>Exam Result</h2>

<%
int subject_id = Integer.parseInt(request.getParameter("subject_id"));

int score = 0;
int total = 0;

Integer user_id = (Integer)session.getAttribute("user_id");
String student_name = (String)session.getAttribute("username");

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM questions WHERE subject_id=?");

ps.setInt(1, subject_id);

ResultSet rs = ps.executeQuery();

while(rs.next()){

String correct = rs.getString("correct_answer");
String student = request.getParameter("q"+rs.getInt("id"));

if(correct != null){
total++;

if(student != null && correct.equals(student)){
score++;
}
}

}

/* INSERT RESULT */

PreparedStatement insert = con.prepareStatement(
"INSERT INTO results(user_id, student_name, subject_id, score, total_questions) VALUES(?,?,?,?,?)");

insert.setInt(1,user_id);
insert.setString(2,student_name);
insert.setInt(3,subject_id);
insert.setInt(4,score);
insert.setInt(5,total);

insert.executeUpdate();

int wrong = total - score;
int percent = (score * 100) / total;

%>

<div class="score">
<%=score%> / <%=total%>
</div>

<div class="row">

<div class="col-md-4">
<div class="stat-box">
<h5>Total</h5>
<p><%=total%></p>
</div>
</div>

<div class="col-md-4">
<div class="stat-box">
<h5>Correct</h5>
<p style="color:green;"><%=score%></p>
</div>
</div>

<div class="col-md-4">
<div class="stat-box">
<h5>Wrong</h5>
<p style="color:red;"><%=wrong%></p>
</div>
</div>

</div>

<br>

<h5>Performance</h5>

<div class="progress">
<div class="progress-bar bg-success"
style="width:<%=percent%>%">
<%=percent%>%
</div>
</div>

<br><br>

<a href="student.jsp" class="btn-dashboard">
Back to Dashboard
</a>

<%

}catch(Exception e){
out.println("Error: " + e.getMessage());
}

%>

</div>

</body>
</html>