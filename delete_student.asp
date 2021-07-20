<!-- #include file ="resource\koneksi.inc" --> 

<%
    Dim id
    Dim rs

    Set id = Request.QueryString("id")
    Set rs=db.Execute("DELETE Student WHERE ID='"& id &"'")

%>

<script> window.location="student.asp"; </script>
