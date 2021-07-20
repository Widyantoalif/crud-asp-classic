<!-- #include file ="resource\koneksi.inc" --> 

<%
    Dim ID
    Dim rs
    Dim T
    Dim LM
    Dim G

    Set ID = Request.QueryString("id")
    Set T = Request.Form("Title")
    Set LM = Request.Form("LastName")
    Set G = Request.Form("Grade1")

    Set rs = db.Execute("Update Enrollment set CourseID = '" & T & "', StudentID = '" & LM & "', Grade = '" & G & "' where EnrollmentID = '" & ID & "'")
%>

<script> window.location="enrollment.asp"; </script>