<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Examination System</title>

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
margin-left:15px;
}

.nav-link:hover{
color:#38bdf8 !important;
}

.hero{
height:80vh;
display:flex;
align-items:center;
justify-content:center;
text-align:center;
background:linear-gradient(135deg,#2563eb,#1e3a8a);
color:white;
}

.hero h1{
font-size:48px;
font-weight:600;
}

.hero p{
font-size:18px;
margin-top:10px;
}

.hero .btn{
margin-top:20px;
padding:12px 30px;
font-size:16px;
border-radius:30px;
}


.features{
padding:60px 0;
}

.feature-card{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
text-align:center;
transition:0.3s;
}

.feature-card:hover{
transform:translateY(-5px);
}

.feature-card i{
font-size:40px;
color:#2563eb;
margin-bottom:15px;
}


.footer{
background:#1e293b;
color:white;
text-align:center;
padding:15px;
margin-top:40px;
}

</style>

</head>

<body>


<nav class="navbar navbar-expand-lg">
<div class="container">

<a class="navbar-brand" href="#">Online Exam</a>

<div class="ms-auto">
<a class="nav-link d-inline" href="login.jsp">Login</a>
<a class="nav-link d-inline" href="register.jsp">Register</a>
</div>

</div>
</nav>


<section class="hero">
<div>

<h1>Online Examination System</h1>
<p>Take exams anytime, anywhere and get instant results</p>

<a href="login.jsp" class="btn btn-light">Start Exam</a>

</div>
</section>


<section class="features">
<div class="container">

<div class="row text-center">

<div class="col-md-4">
<div class="feature-card">
<i class="fa-solid fa-user-lock"></i>
<h4>Secure Login</h4>
<p>Safe authentication system for students and administrators.</p>
</div>
</div>

<div class="col-md-4">
<div class="feature-card">
<i class="fa-solid fa-clock"></i>
<h4>Timed Exams</h4>
<p>Exams are conducted with a countdown timer for fairness.</p>
</div>
</div>

<div class="col-md-4">
<div class="feature-card">
<i class="fa-solid fa-chart-column"></i>
<h4>Instant Results</h4>
<p>Automatically calculate and display exam results instantly.</p>
</div>
</div>

</div>

</div>
</section>


<div class="footer">
<p>© 2026 Online Examination System</p>
</div>

</body>
</html>