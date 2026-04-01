<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Add Question</title>
</head>
<body>
<h2>Add Question</h2>

<form action="<%=request.getContextPath()%>/AddQuestionServlet" method="post">
Subject ID
<input type="number" name="subject_id">

<br><br>

Question
<input type="text" name="question">

<br><br>

Option 1
<input type="text" name="op1">

<br><br>

Option 2
<input type="text" name="op2">

<br><br>

Option 3
<input type="text" name="op3">

<br><br>

Option 4
<input type="text" name="op4">

<br><br>

Correct Answer
<input type="text" name="correct">

<br><br>

<button type="submit">Add Question</button>

</form>
</body>
</html>