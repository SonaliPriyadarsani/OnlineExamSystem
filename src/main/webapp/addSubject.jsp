<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Subject</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
background:#f4f6fb;
font-family:Arial;
}

.card{
margin-top:80px;
padding:30px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
}
</style>

</head>

<body>

<div class="container">
<div class="row justify-content-center">
<div class="col-md-6">

<div class="card">

<h3 class="text-center mb-4">Add New Subject</h3>

<form action="<%=request.getContextPath()%>/AddSubjectServlet" method="post">

<div class="mb-3">
<label class="form-label">Subject Name</label>
<input type="text" name="subject" class="form-control" required>
</div>

<div class="mb-3">
<label class="form-label">Reference Book Link</label>
<input type="text" name="link" class="form-control">
</div>

<button class="btn btn-primary w-100">Add Subject</button>

</form>

<br>

<a href="admin.jsp" class="btn btn-secondary w-100">Back to Dashboard</a>

</div>

</div>
</div>
</div>

</body>
</html>