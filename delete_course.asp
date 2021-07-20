<!-- #include file ="resource\koneksi.inc" --> 

<%
    Dim id
    Dim rs

    Set id = Request.QueryString("id")
    Set rs=db.Execute("DELETE Course WHERE CourseID='"& id &"'")

%>

<script> window.location="course.asp"; </script>
