<!-- #include file ="resource\koneksi.inc" --> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Course</title>
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
            <h2>Courses</h2>
            <p>
                <a href="course_create.asp">Create New</a>
            </p>
            <h4>Search Course</h4>
            <hr>
                <form action="course.asp" method="POST">
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
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Credits From</td>
                            <td Class="col-md-7">
                                <input type="text" name="Credit1" class="form-control ">
                            </td>
                        </tr>
                        <tr>
                            <td><p></p></td>
                        </tr>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Credits To</td>
                            <td  Class="col-md-7">
                                <input type="text" name="Credit2" class="form-control">
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
                    Dim C1
                    Dim C2

                    Set T  = Request.Form("Title")
                    Set C1 = Request.Form("Credit1")
                    Set C2 = Request.Form("Credit2")

                    If C1 = "" Then
                        If C1 = C1 Then
                            Set rs = db.Execute("SELECT * FROM Course WHERE Title LIKE '%" & T & "%'")
                        Else
                            Set rs = db.Execute("SELECT * FROM Course WHERE Credits >= '" & C1 & "' AND Credits <= '" & C2 & "'")
                        End if
                    Else
                        Set rs = db.Execute("SELECT * FROM Course WHERE Title LIKE '%" & T & "%' AND Credits >= '" & C1 & "'  AND Credits <= '" & C2 & "'")
                    End if


                %>
                <table class="table" id="data">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Credits</th>
                        </tr>
                    </thead>
                    <tbody>
                              <%
                    While NOT rs.eof  'loop through the dataset'
                    %>
                        <tr>
                            <td><%= rs("Title") %></td>
                            <td><%= rs("Credits") %></td>
                            <td><a href="edit_course.asp?id=<%= rs("CourseID") %>" style="margin-right: 0.5%;">Edit</a>|<a href="detail_course.asp?id=<%= rs("CourseID") %>" style="margin-right: 0.5%; margin-left: 0.5%;">Detail</a>|<a href="delete_course.asp?id=<%= rs("CourseID") %>" style="margin-right: 0.5%;">Delete</a></td>
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
            <hr>
            <!-- #include file ="resource\footer.inc" --> 
        </div>
    </body>
</html>






