<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<%
int subject_id = Integer.parseInt(request.getParameter("subject_id"));
%>

<!DOCTYPE html>
<html>
<head>
<title>Online Exam</title>

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

/* Exam Container */

.exam-container{
max-width:900px;
margin:auto;
margin-top:40px;
}

/* Timer */

.timer-box{
background:#ef4444;
color:white;
padding:10px 20px;
border-radius:8px;
font-weight:600;
float:right;
}

/* Question Card */

.question-card{
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
margin-bottom:25px;
}

/* Options */

.option{
display:block;
padding:8px;
margin-top:5px;
}

/* Submit Button */

.submit-btn{
background:#2563eb;
color:white;
border:none;
padding:12px 25px;
border-radius:8px;
font-size:16px;
}

.submit-btn:hover{
background:#1d4ed8;
}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg">
<div class="container">
<a class="navbar-brand">Online Exam</a>
</div>
</nav>

<div class="container exam-container">

<h2 class="mb-3">Online Examination</h2>

<%
int questionCount = 0;

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM questions WHERE subject_id=?");

ps.setInt(1, subject_id);

ResultSet rs = ps.executeQuery();

while(rs.next()){

String question = rs.getString("question");

if(question == null || question.trim().equals("")){
continue;
}

questionCount++;
}

}catch(Exception e){
e.printStackTrace();
}
%>

<p><b>Total Questions:</b> <%=questionCount%></p>
<p><b>Total Time:</b> <%=questionCount * 10%> seconds</p>

<div class="timer-box">
Time Remaining: <span id="timer"></span>
</div>

<form action="result.jsp" method="post">

<input type="hidden" name="subject_id" value="<%=subject_id%>">

<%
try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM questions WHERE subject_id=?");

ps.setInt(1, subject_id);

ResultSet rs = ps.executeQuery();

int qno = 1;

while(rs.next()){

String question = rs.getString("question");

if(question == null || question.trim().equals("")){
continue;
}
%>

<div class="question-card">

<p><b>Question <%=qno++%>:</b> <%=question%></p>

<label class="option">
<input type="radio" name="q<%=rs.getInt("id")%>" value="option1">
<%=rs.getString("option1")%>
</label>

<label class="option">
<input type="radio" name="q<%=rs.getInt("id")%>" value="option2">
<%=rs.getString("option2")%>
</label>

<label class="option">
<input type="radio" name="q<%=rs.getInt("id")%>" value="option3">
<%=rs.getString("option3")%>
</label>

<label class="option">
<input type="radio" name="q<%=rs.getInt("id")%>" value="option4">
<%=rs.getString("option4")%>
</label>

</div>

<%
}

}catch(Exception e){
e.printStackTrace();
}
%>

<div class="text-center mb-5">
<input type="submit" value="Submit Exam" class="submit-btn">
</div>

</form>

</div>

<script>

/* Total questions from JSP */
var totalQuestions = <%=questionCount%>;

/* 10 seconds per question */
var time = totalQuestions * 10;

function startTimer(){

var minutes = Math.floor(time / 60);
var seconds = time % 60;

if(seconds < 10){
seconds = "0" + seconds;
}

document.getElementById("timer").innerHTML = minutes + ":" + seconds;

time--;

if(time < 0){
alert("Time is over! Exam will be submitted.");
document.forms[0].submit();
}

}

setInterval(startTimer,1000);

</script>

</body>
</html>