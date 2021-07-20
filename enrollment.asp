 <!-- #include file ="resource\koneksi.inc" --> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Enrollment</title>
        <!-- #include file ="resource\boostrap.inc" --> 
    </head>
    <body>
        <script>
            $(document).ready(function(){
                $('#data').after('<div id="nav"></div>');
                var rowsShown = 4;
                var rowsTotal = $('#data tbody tr').length;
                var numPages = rowsTotal/rowsShown;
                for(i = 0;i < numPages;i++) {
                    var pageNum = i + 1;
                    $('#nav').append('<a href="#" rel="'+i+'">'+pageNum+'</a> ');
                }
                $('#data tbody tr').hide();
                $('#data tbody tr').slice(0, rowsShown).show();
                $('#nav a:first').addClass('active');
                $('#nav a').bind('click', function(){

                    $('#nav a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data tbody tr').css('opacity','0.0').hide().slice(startItem, endItem).
                    css('display','table-row').animate({opacity:1}, 300);
                });
            });
        </script>
        <!-- #include file ="resource\header.inc" --> 
        <div class="p-4 container">
            <h2>Enrollments</h2>
            <p><a href="enrollment_create.asp">Create New</a></p>           
            <h4>Search Enrollment</h4>
            <hr>
                <form action="enrollment.asp" method="POST">
                    <table >
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Title</td>
                            <td Class="col-md-7">
                                <input type="text" name="Title" class="form-control ">
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Last Name</td>
                            <td Class="col-md-7">
                                <input type="text" name="LastName" class="form-control ">
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Grade</td>
                            <td  Class="col-md-7">
                                <input type="text" name="Grade" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold;">&nbsp;</td>
                            <td Class="col-md-7">
                                <input type="submit" name="submit" Class="btn btn-primary" value="Search">
                            </td>
                        </tr>
                    </table>
                </form>
            <hr>
            <div class="container" id="nav">
                <%
                    Dim rs
                    Dim T
                    Dim LS
                    Dim G

                    Set T  = Request.Form("Title")
                    Set LS = Request.Form("LastName")
                    Set G  = Request.Form("Grade")

                    Set rs=db.Execute("SELECT Enrollment.EnrollmentID AS ID, Course.Title, Student.LastName AS Name, Enrollment.Grade FROM Enrollment INNER JOIN Student ON Enrollment.StudentID=Student.ID INNER JOIN Course ON Enrollment.CourseID=Course.CourseID WHERE Enrollment.Grade LIKE '%" & G & "%' AND Course.Title LIKE '%" & T & "%' AND Student.LastName LIKE '%" & LS & "%' ")

                %>
                <table class="table" id="data">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>LastName</th>
                            <th>Grade</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    While NOT rs.eof  'loop through the dataset'
                    %>
                        <tr>
                            <td><%= rs("Title") %></td>
                            <td><%= rs("Name") %></td>
                            <td><%= rs("Grade") %></td>
                            <td><a href="edit_enrollment.asp?id=<%= rs("ID") %>" style="margin-right: 0.5%;">Edit</a>|<a href="detail_enrollment.asp?id=<%= rs("ID") %>" style="margin-right: 0.5%; margin-left: 0.5%;">Detail</a>|<a href="delete_enrollment.asp?id=<%= rs("ID") %>" style="margin-right: 0.5%;">Delete</a></td>
                        </tr>
                    <%
                        rs.MoveNext
                        Wend 'end while

                        rs.close
                        Set rs = Nothing
                    %> 
                    </tbody>
                </table>

            </div>

        </div>

        <div class="container">
            <!-- #include file ="resource\footer.inc" --> 
        </div>
    </body>
</html>
