<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Add Question</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
background:#f4f6fb;
font-family:Arial;
}

.card{
margin-top:40px;
padding:30px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
}
</style>

</head>

<body>

<div class="container">

<div class="row justify-content-center">

<div class="col-md-8">

<div class="card">

<h3 class="text-center mb-4">Add Question</h3>

<form action="<%=request.getContextPath()%>/AddQuestionServlet" method="post">

<div class="mb-3">
<label>Subject</label>

<select name="subject_id" class="form-control">

<%
try{

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM subjects");
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<option value="<%=rs.getInt("id")%>">
<%=rs.getString("subject_name")%>
</option>

<%
}

}catch(Exception e){
e.printStackTrace();
}
%>

</select>

</div>

<div class="mb-3">
<label>Question</label>
<input type="text" name="question" class="form-control">
</div>

<div class="mb-3">
<label>Option 1</label>
<input type="text" name="op1" class="form-control">
</div>

<div class="mb-3">
<label>Option 2</label>
<input type="text" name="op2" class="form-control">
</div>

<div class="mb-3">
<label>Option 3</label>
<input type="text" name="op3" class="form-control">
</div>

<div class="mb-3">
<label>Option 4</label>
<input type="text" name="op4" class="form-control">
</div>

<div class="mb-3">
<label>Correct Answer</label>

<select name="correct" class="form-control">
<option value="option1">Option 1</option>
<option value="option2">Option 2</option>
<option value="option3">Option 3</option>
<option value="option4">Option 4</option>
</select>

</div>

<button class="btn btn-success w-100">Add Question</button>

</form>

<br>

<a href="admin.jsp" class="btn btn-secondary w-100">Back to Dashboard</a>

</div>

</div>
</div>

</div>

</body>
</html>