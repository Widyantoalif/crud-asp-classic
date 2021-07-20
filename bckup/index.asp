<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD</title>
</head>
<body>
    <%

        dim sqlUsername : sqlUsername = "sa"
        dim sqlPassword : sqlPassword = "Password123"
        dim ConnectionString : ConnectionString = "DRIVER={SQL Server};SERVER=DESKTOP-T0MS1O2;DATABASE=contoso_db;UID=" &sqlUsername&"; PWD="&sqlPassword&""
        Dim db
        set db = server.CreateObject("ADODB.Connection")
        db.Open connectionstring ,sqlUsername, sqlPassword


        set rs=db.Execute("select * from student")


    %>
    <table>
        <tr>
            <td>Nama Depan</td>
            <td>Nama Belakang</td>
            <td>Tanggal Pendaftaran</td>
        </tr>
        <tr>
            <%
                Do Until rs.EOF
                    Response.Write("<tr>")
                        For Each x In rs.Fields
                            Response.Write("<td>" & x.value & "</td>")
                        Next
                    Response.Write("</tr")
                    rs.movenext
                Loop
            %>
        </tr>
    </table>
</body>
</html>





