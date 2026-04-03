<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>
<html>
<head>
<title>Choose Subject</title>
</head>

<body>

<h2>Select Subject for Exam</h2>

<form action="exam.jsp" method="get">

<select name="subject_id">

<%
try{

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("select * from subjects");
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

<br><br>

<button type="submit">Start Exam</button>

</form>

<a href="viewResult.jsp">View My Results</a>

</body>
</html>