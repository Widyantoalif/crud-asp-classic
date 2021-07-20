<!-- #include file ="resource\koneksi.inc" --> 

<%
    Dim ID
    Dim rs
    Dim rs1
    Dim T
    Dim C

    Set rs = db.Execute("select * FROM Course ORDER BY CourseID DESC")

    'Id Baru'
    ID = rs("CourseID")+1

    Set T = Request.Form("Title")
    Set C = Request.Form("Credit1")

    Set rs1=db.Execute("Insert into Course values ('" & ID & "', '" & T & "', '" & C & "')")
%>

<script> window.location="course.asp"; </script>