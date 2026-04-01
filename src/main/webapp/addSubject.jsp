<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Add Subject</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/AddSubjectServlet" method="post">
Subject Name:
<input type="text" name="subject"><br><br>

Reference Book Link:
<input type="text" name="link"><br><br>

<button type="submit">Add Subject</button>

</form>
</body>
</html>