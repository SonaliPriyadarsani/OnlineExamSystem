<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<title>View Questions</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body style="background:#f4f6fb">

<div class="container mt-5">

<h2 class="text-center mb-4">All Questions</h2>

<table class="table table-bordered table-striped">

<tr>
<th>ID</th>
<th>Subject</th>
<th>Question</th>
<th>Option1</th>
<th>Option2</th>
<th>Option3</th>
<th>Option4</th>
<th>Answer</th>
</tr>

<%

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("select * from questions");

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>

<td><%=rs.getInt("id")%></td>
<td><%=rs.getInt("subject_id")%></td>
<td><%=rs.getString("question")%></td>
<td><%=rs.getString("option1")%></td>
<td><%=rs.getString("option2")%></td>
<td><%=rs.getString("option3")%></td>
<td><%=rs.getString("option4")%></td>
<td><%=rs.getString("correct_answer")%></td>

</tr>

<%
}

}catch(Exception e){
e.printStackTrace();
}
%>

</table>

<a href="admin.jsp" class="btn btn-secondary">Back to Dashboard</a>

</div>

</body>
</html>