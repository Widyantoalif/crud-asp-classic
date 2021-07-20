<!-- #include file ="resource\koneksi.inc" --> 

<%
    Dim ID
    Dim rs
    Dim LN
    Dim FM
    Dim ED

    Set ID = Request.QueryString("id")
    Set LN = Request.Form("LastName")
    Set FM = Request.Form("FirstMidName")
    Set ED = Request.Form("EnrollmentDate")

    Set rs = db.Execute("Update Student set LastName = '" & LN & "', FirstMidName = '" & FM & "', EnrollmentDate = '" & ED & "' where ID = '" & ID & "'")
%>

<script> window.location="student.asp"; </script>