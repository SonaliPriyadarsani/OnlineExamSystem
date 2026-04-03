<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>

<html>
<head>
<title>Exam Result</title>
</head>

<body>

<h2>Exam Result</h2>

<%

int subject_id = Integer.parseInt(request.getParameter("subject_id"));

int score = 0;
int total = 0;

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM questions WHERE subject_id=?");

ps.setInt(1, subject_id);

ResultSet rs = ps.executeQuery();

while(rs.next()){

    total++;

    String correct = rs.getString("correct_answer");
    String student = request.getParameter("q"+rs.getInt("id"));

    if(student != null && correct.equals(student)){
        score++;
    }
}

/* Get student details from session */

String student_name = (String)session.getAttribute("username");
Integer userIdObj = (Integer)session.getAttribute("user_id");

/* safety check */

if(userIdObj == null){
    response.sendRedirect("login.jsp");
    return;
}

int user_id = userIdObj;

/* Insert result into database */

PreparedStatement ps2 = con.prepareStatement(
"INSERT INTO results(user_id,student_name,subject_id,score,total_questions) VALUES(?,?,?,?,?)");

ps2.setInt(1, user_id);
ps2.setString(2, student_name);
ps2.setInt(3, subject_id);
ps2.setInt(4, score);
ps2.setInt(5, total);

ps2.executeUpdate();

%>

<h3>Total Questions: <%=total%></h3>

<h3>Correct Answers: <%=score%></h3>

<h3>Wrong Answers: <%=total-score%></h3>

<h2>Your Score: <%=score%> / <%=total%></h2>

<br>

<a href="student.jsp">Back to Dashboard</a>

<%

}catch(Exception e){
    e.printStackTrace();
}

%>

</body>
</html>