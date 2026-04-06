<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login | Online Examination System</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
font-family:'Poppins',sans-serif;
background:#f4f6fb;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
margin:0;
}


.login-card{
background:white;
padding:40px;
border-radius:12px;
width:350px;
box-shadow:0 6px 20px rgba(0,0,0,0.1);
}

.login-card h2{
text-align:center;
margin-bottom:25px;
color:#1e293b;
}


.form-control{
border-radius:8px;
padding:10px;
}


.btn-primary{
background:#2563eb;
border:none;
width:100%;
padding:10px;
border-radius:8px;
}

.btn-primary:hover{
background:#1d4ed8;
}


.register-link{
text-align:center;
margin-top:15px;
}

.register-link a{
color:#2563eb;
text-decoration:none;
font-weight:500;
}

</style>

</head>

<body>

<div class="login-card">

<h2>Student Login</h2>

<form action="LoginServlet" method="post">

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<button type="submit" class="btn btn-primary">Login</button>

</form>

<div class="register-link">
<p>Don't have an account? <a href="register.jsp">Register</a></p>
</div>

</div>

</body>
</html>