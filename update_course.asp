<!-- #include file ="resource\koneksi.inc" --> 

<%
    Dim ID
    Dim rs
    Dim T
    Dim C

    Set ID = Request.QueryString("id")
    Set T  = Request.Form("Title")
    Set C  = Request.Form("Credit1")

    Set rs = db.Execute("Update Course set Title = '" & T & "', Credits = '" & C & "' where CourseID = '" & ID & "'")
%>

<script> window.location="course.asp"; </script>