<!-- #include file ="resource\koneksi.inc" -->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Edit Student</title>
        <!-- #include file ="resource\boostrap.inc" --> 
    </head>
    <body>
        <!-- #include file ="resource\header.inc" --> 
        <div class="p-4 container">
            <h2>Edit Student</h2>
                <%
                    Dim id
                    Dim rs

                    Set id = Request.QueryString("id")
                    Set rs=db.Execute("SELECT * FROM Student WHERE ID='"& id &"'")

                %>
            <hr>  
                <form action="update_student.asp?id=<%= Response.Write(id) %>" method="POST">
                    <table >
                        <tr>
                                <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Last Name</td>
                                <td Class="col-md-7">
                                    <input type="text" name="LastName" class="form-control " value="<%= rs("LastName") %>">
                                </td>
                            </tr>
                            <tr>
                                <td><p></p></td>
                            </tr>
                            <tr>
                                <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">First Mid Name</td>
                                <td Class="col-md-7">
                                     <input type="text" name="FirstMidName" class="form-control " value="<%= rs("FirstMidName") %>">
                                </td>
                            </tr>
                            <tr>
                                <td><p></p></td>
                            </tr>
                            <tr>
                                <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Enrollment Date</td>
                                <td  Class="col-md-7">
                                     <input type="Date" name="EnrollmentDate" class="form-control" value="<%= rs("EnrollmentDate") %>">
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
            <p><a href="student.asp">Back To List</a></p>
        </div>
        <div class="container">
            <hr>
            <!-- #include file ="resource\footer.inc" --> 
        </div>
    </body>
</html>







