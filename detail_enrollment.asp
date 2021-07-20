<!-- #include file ="resource\koneksi.inc" --> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Detail Enrollment</title>
        <!-- #include file ="resource\boostrap.inc" --> 
    </head>
    <body>
        <!-- #include file ="resource\header.inc" --> 
        <div class="p-4 container">
            <h2>Detail Enrollment</h2>
            <hr>
                <%
                    Dim id
                    Dim rs

                    Set id = Request.QueryString("id")
                    Set rs=db.Execute("SELECT Enrollment.EnrollmentID As ID, Course.Title, Student.LastName As Name, Enrollment.Grade FROM Enrollment INNER JOIN Student ON Enrollment.StudentID=Student.ID INNER JOIN Course ON Enrollment.CourseID=Course.CourseID WHERE EnrollmentID='"& id &"'")

                %>
                <table>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Title</td>
                        <td Class="col-md-7">
                         : <%= rs("Title") %>
                        </td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Last Name</td>
                        <td Class="col-md-7">
                          : <%= rs("Name")%>
                        </td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Grade</td>
                        <td Class="col-md-7">
                          : <%= rs("Grade")%>
                        </td>
                    </tr>
                </table>
            <hr>
            <p><a href="edit_enrollment.asp?id=<% Response.Write(id) %>">Edit</a> | <a href="enrollment.asp">Back To List</a></p>
        </div>
        <div class="container">
            <hr>
            <!-- #include file ="resource\footer.inc" --> 
        </div>
    </body>
</html>







