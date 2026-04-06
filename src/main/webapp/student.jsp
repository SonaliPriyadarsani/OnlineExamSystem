<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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


.dashboard{
padding:60px 0;
text-align:center;
}

.dashboard h1{
margin-bottom:40px;
color:#1e293b;
}


.card-box{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
transition:0.3s;
text-align:center;
}

.card-box:hover{
transform:translateY(-6px);
}

.card-box i{
font-size:40px;
color:#2563eb;
margin-bottom:15px;
}

.card-box a{
text-decoration:none;
font-weight:500;
color:#1e293b;
}

</style>

</head>

<body>


<nav class="navbar navbar-expand-lg">
<div class="container">

<a class="navbar-brand" href="#">Online Exam</a>

<div class="ms-auto">
<a class="nav-link" href="logout.jsp">Logout</a>
</div>

</div>
</nav>


<div class="container dashboard">

<h1>Welcome Student</h1>

<div class="row justify-content-center g-4">

<div class="col-md-3">
<div class="card-box">
<i class="fa-solid fa-pen-to-square"></i>
<h4><a href="chooseSubject.jsp">Start Exam</a></h4>
</div>
</div>

<div class="col-md-3">
<div class="card-box">
<i class="fa-solid fa-chart-column"></i>
<h4><a href="viewResult.jsp">View My Results</a></h4>
</div>
</div>

</div>

</div>

</body>
</html>