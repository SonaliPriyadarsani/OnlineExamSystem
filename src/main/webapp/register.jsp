<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register | Online Examination System</title>

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


.register-card{
background:white;
padding:40px;
border-radius:12px;
width:380px;
box-shadow:0 6px 20px rgba(0,0,0,0.1);
}

.register-card h2{
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


.login-link{
text-align:center;
margin-top:15px;
}

.login-link a{
color:#2563eb;
text-decoration:none;
font-weight:500;
}

</style>

</head>

<body>

<div class="register-card">

<h2>Create Account</h2>

<form action="<%=request.getContextPath()%>/RegisterServlet" method="post">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<input type="hidden" name="role" value="student">

<button type="submit" class="btn btn-primary">Register</button>

</form>

<div class="login-link">
<p>Already have an account? <a href="login.jsp">Login</a></p>
</div>

</div>

</body>
</html>