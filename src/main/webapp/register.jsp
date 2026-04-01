<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>

<h2>Register</h2>

<form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>

<input type="hidden" name="role" value="student">
    <br><br>

    <button type="submit">Register</button>
</form>

<br>

<!-- Link to Login -->
<p>Already have an account? <a href="login.jsp">Login here</a></p>

</body>
</html>