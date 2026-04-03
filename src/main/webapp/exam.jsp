<%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>
<%
int subject_id = Integer.parseInt(request.getParameter("subject_id"));
%>

<html>
<head>
<title>Exam</title>
</head>

<body>

<h2>Online Exam</h2>
<div style="font-size:20px; color:red; font-weight:bold;">
Time Remaining: <span id="timer">05:00</span>
</div>
<form action="result.jsp" method="post">

<input type="hidden" name="subject_id" value="<%=subject_id%>">

<%
try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM questions WHERE subject_id=?");

ps.setInt(1,subject_id);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<p>
<b>Question:</b> <%=rs.getString("question")%>
</p>

<input type="radio" name="q<%=rs.getInt("id")%>" value="<%=rs.getString("option1")%>" required>
<%=rs.getString("option1")%><br>

<input type="radio" name="q<%=rs.getInt("id")%>" value="<%=rs.getString("option2")%>">
<%=rs.getString("option2")%><br>

<input type="radio" name="q<%=rs.getInt("id")%>" value="<%=rs.getString("option3")%>">
<%=rs.getString("option3")%><br>

<input type="radio" name="q<%=rs.getInt("id")%>" value="<%=rs.getString("option4")%>">
<%=rs.getString("option4")%><br>
<hr>

<%
}
}catch(Exception e){
e.printStackTrace();
}
%>

<input type="submit" value="Submit Exam">

</form>
<script>

var time = 300; 

function startTimer() {

    var minutes = Math.floor(time / 60);
    var seconds = time % 60;

    if(seconds < 10){
        seconds = "0" + seconds;
    }

    document.getElementById("timer").innerHTML = minutes + ":" + seconds;

    time--;

    if(time < 0){
        alert("Time is over! Exam will be submitted.");
        document.forms[0].submit(); 
    }

}

setInterval(startTimer,1000);

</script>
</body>
</html>