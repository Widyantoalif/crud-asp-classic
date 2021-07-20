
<!-- #include file ="resource\koneksi.inc" --> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Edit Enrollment</title>
        <!-- #include file ="resource\boostrap.inc" --> 
    </head>
    <body>
        <!-- #include file ="resource\header.inc" --> 
        <div class="p-4 container">
            <h2>Edit Enrollment</h2>

            <hr>
               <%
                    Dim id
                    Dim rs
                    Dim rs1
                    Dim rs2

                    Set id = Request.QueryString("id")

                    Set rs=db.Execute("SELECT Enrollment.EnrollmentID As ID, Course.CourseID, Course.Title, Student.ID, Student.LastName As Name, Enrollment.Grade FROM Enrollment INNER JOIN Student ON Enrollment.StudentID=Student.ID INNER JOIN Course ON Enrollment.CourseID=Course.CourseID WHERE EnrollmentID='"& id &"'")
                    Set rs1=db.Execute("SELECT * FROM Course")
                    Set rs2=db.Execute("SELECT * FROM Student")
                %>
                <form action="update_enrollment.asp?id=<%= Response.Write(id) %>" method="POST">
                    <table>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Title</td>
                            <td Class="col-md-7">
                                <select name="Title" class="form-control" id="Title">
                                    <%
                                    While NOT rs1.eof  'loop through the dataset'
                                    %>
                                        <option value="<%= rs1("CourseID")  %>" <% if rs1("CourseID") = rs("CourseID") then Response.Write("selected") %> ><%= rs1("Title") %></option>
                                    <%
                                        rs1.MoveNext
                                        Wend 'end while

                                        rs1.close
                                        Set rs1 = Nothing
                                    %> 
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Last Name</td>
                            <td Class="col-md-7">
                                    <select name="LastName" class="form-control" id="LastName">
                                            <%
                                            While NOT rs2.eof  'loop through the dataset'
                                            %>
                                                <option value="<%= rs2("ID") %>" <% if rs2("ID") = rs("ID") then Response.Write("selected") %> ><%= rs2("LastName") %></option>
                                            <%
                                                rs2.MoveNext
                                                Wend 'end while

                                                rs2.close
                                                Set rs2 = Nothing
                                            %> 
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Grade</td>
                            <td  Class="col-md-7">
                                <input type="text" name="Grade1" class="form-control" value="<%= rs("Grade") %>">
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold;">&nbsp;</td>
                            <td Class="col-md-7">
                                <input type="submit" name="submit" Class="btn btn-primary" value="Save">
                            </td>
                        </tr>
                    </table>
                </form>
            <hr>
            <p><a href="enrollment.asp">Back To List</a></p>
        </div>
        <div class="container">
            <hr>
            <!-- #include file ="resource\footer.inc" --> 
        </div>
    </body>
</html>







