<!-- #include file ="resource\koneksi.inc" --> 

<%
    Dim id
    Dim rs

    Set id = Request.QueryString("id")
    Set rs=db.Execute("DELETE Enrollment WHERE EnrollmentID='"& id &"'")

%>

<script> window.location="enrollment.asp"; </script>
