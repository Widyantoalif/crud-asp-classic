<!-- #include file ="resource\koneksi.inc" --> 

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Detail Student</title>

        <!-- #include file ="resource\boostrap.inc" --> 

    </head>
    <body>
        <!-- #include file ="resource\header.inc" --> 
        <div class="p-4 container">
            <h2>Detail</h2>

            <h4>Student</h4>

            <hr>
                <%
                    Dim id
                    Dim rs

                    Set id = Request.QueryString("id")
                    Set rs=db.Execute("SELECT Student.LastName, Student.FirstMidName, Student.EnrollmentDate, Course.Title, Enrollment.Grade FROM Enrollment INNER JOIN Student ON Enrollment.StudentID=Student.ID INNER JOIN Course ON Enrollment.CourseID=Course.CourseID WHERE Student.ID='"& id &"'")

                %>
                <table class="nav-justified">
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Last Name</td>
                        <td Class="col-md-7">
                            : <%= rs("LastName") %>
                        </td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">First Mid Name</td>
                        <td Class="col-md-7">
                            : <%= rs("FirstMidName") %>
                        </td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Enrollment Date</td>
                        <td  Class="col-md-7">
                            : <%= rs("EnrollmentDate") %>
                        </td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Enrollment</td>
                        <td class="col-md-2 text-left" style="font-weight: bold;">Title</td>
                        <td class="col-md-2 text-center" style="font-weight: bold;">Grade</td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <%
                    While NOT rs.eof  'loop through the dataset'
                    %>

                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;"><p></p></td>
                        <td class="col-md-2 text-left"><%= rs("Title") %></td>
                        <td class="col-md-2 text-center"><%= rs("Grade") %></td>
                    </tr>

                    <%
                        rs.MoveNext
                        Wend 'end while

                        rs.close
                        Set rs = Nothing
                    %> 
                </table>

            <hr>

            <p><a href="edit_student.asp?id=<% Response.Write(id) %>">Edit</a> | <a href="student.asp">Back To List</a></p>

        </div>

        <div class="container">
            <!-- #include file ="resource\footer.inc" --> 
        </div>
    </body>
</html>







