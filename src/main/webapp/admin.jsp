<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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

.nav-link{
color:white !important;
}

/* Dashboard */

.dashboard{
padding:60px 0;
text-align:center;
}

.dashboard h1{
margin-bottom:40px;
color:#1e293b;
}

/* Cards */

.admin-card{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
transition:0.3s;
text-align:center;
}

.admin-card:hover{
transform:translateY(-6px);
}

.admin-card i{
font-size:40px;
color:#2563eb;
margin-bottom:15px;
}

.admin-card a{
text-decoration:none;
color:#1e293b;
font-weight:500;
}

</style>

</head>

<body>

<nav class="navbar navbar-expand-lg">
<div class="container">

<a class="navbar-brand">Online Exam Admin</a>

<div class="ms-auto">
<a class="nav-link" href="logout.jsp">Logout</a>
</div>

</div>
</nav>

<div class="container dashboard">

<h1>Admin Dashboard</h1>

<div class="row g-4 justify-content-center">

<div class="col-md-3">
<div class="admin-card">
<i class="fa-solid fa-book"></i>
<h5><a href="addSubject.jsp">Add Subject</a></h5>
</div>
</div>

<div class="col-md-3">
<div class="admin-card">
<i class="fa-solid fa-plus"></i>
<h5><a href="addQuestion.jsp">Add Question</a></h5>
</div>
</div>

<div class="col-md-3">
<div class="admin-card">
<i class="fa-solid fa-list"></i>
<h5><a href="viewQuestions.jsp">View Questions</a></h5>
</div>
</div>

<div class="col-md-3">
<div class="admin-card">
<i class="fa-solid fa-chart-column"></i>
<h5><a href="viewData.jsp">View Report</a></h5>
</div>
</div>

</div>

</div>

</body>
</html>