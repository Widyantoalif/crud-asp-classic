<!-- #include file ="resource\koneksi.inc" --> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Edit Course</title>
        <!-- #include file ="resource\boostrap.inc" --> 
    </head>
    <body>
        <!-- #include file ="resource\header.inc" --> 
        <div class="p-4 container">
            <h2>Edit Course</h2>
            <hr>
                   <%
                    Dim id
                    Dim rs

                    Set id = Request.QueryString("id")
                    Set rs=db.Execute("SELECT * FROM Course WHERE CourseID='"& id &"'")

                %>
                <form action="update_course.asp?id=<%= Response.Write(id) %>" method="POST">
                    <table >
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Title</td>
                            <td Class="col-md-7">
                                <input type="text" name="Title" class="form-control " value="<%= rs("Title") %>">
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Credits</td>
                            <td Class="col-md-7">
                                <input type="text" name="Credit1" class="form-control " value="<%= rs("Credits") %>">
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
            <p><a href="course.asp">Back To List</a></p>
        </div>
        <div class="container">
            <hr>
            <!-- #include file ="resource\footer.inc" --> 
        </div>
    </body>
</html>







