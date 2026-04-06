<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<title>Choose Subject</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
font-family:'Poppins',sans-serif;
background:#f4f6fb;
}


.navbar{
background:#1e293b;
}

.navbar-brand{
color:white;
font-weight:600;
}

.nav-link{
color:white !important;
}


.page-title{
text-align:center;
margin-top:40px;
margin-bottom:40px;
color:#1e293b;
}


.subject-card{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
text-align:center;
transition:0.3s;
}

.subject-card:hover{
transform:translateY(-6px);
}

.subject-card h4{
margin-bottom:15px;
color:#1e293b;
}


.btn-start{
background:#2563eb;
color:white;
border:none;
padding:10px 20px;
border-radius:8px;
text-decoration:none;
}

.btn-start:hover{
background:#1d4ed8;
}

</style>

</head>

<body>


<nav class="navbar navbar-expand-lg">
<div class="container">

<a class="navbar-brand">Online Exam</a>

<div class="ms-auto">
<a class="nav-link d-inline" href="student.jsp">Dashboard</a>
<a class="nav-link d-inline" href="viewResult.jsp">Results</a>
</div>

</div>
</nav>

<div class="container">

<h2 class="page-title">Select Subject for Exam</h2>

<div class="row g-4">

<%
try{

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("select * from subjects");
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<div class="col-md-3">

<div class="subject-card">

<h4><%=rs.getString("subject_name")%></h4>

<a class="btn-start"
href="exam.jsp?subject_id=<%=rs.getInt("id")%>">
Start Exam
</a>

</div>

</div>

<%
}

}catch(Exception e){
e.printStackTrace();
}
%>

</div>

</div>

</body>
</html>