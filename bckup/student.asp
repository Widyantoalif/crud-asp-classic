
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Contoso | About</title>

       

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

    <nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Contoso University</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="demo.asp">Home</a></li>
      <li><a href="About">About</a></li>
      <li><a href="student.asp">Student</a></li>
      <li><a href="#">Course</a></li>
      <li><a href="#">Enrollment</a></li>
    </ul>
  </div>
</nav>
<div class="p-4 container">
            <h2>Students Siswa</h2>

            <p><a href="student_create.asp">Create New</a></p>
            
            <h4>Search Student</h4>

            <hr>

                <table >
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Last Name&nbsp;&nbsp;</td>
                        <td Class="col-md-7">
                            <input type="text" name="LastName" class="form-control ">
                        </td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">First Mid Name&nbsp;&nbsp;</td>
                        <td Class="col-md-7">
                            <input type="text" name="FirstMidName" class="form-control ">
                        </td>
                    </tr>
                    <tr>
                        <td><p></p></td>
                    </tr>
                    <tr>
                        <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Enrollment Date&nbsp;&nbsp;</td>
                        <td  Class="col-md-7">
                            <input type="text" name="EnrollmentDate" class="form-control">
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

            <hr>
            <div class="container">

               
                <table class="table">
                    <tr>
                        <th>Last Name</th>
                        <th>First Mid Name</th>
                        <th>Enrollment</th>
                    </tr>
                
                    <tr>
                        <td>("LastName") </td>
                        <td>("FirstMidName")</td>
                        <td>("EnrollmentDate")</td>
                        <td><a href="edit_student.asp" style="margin-right: 0.5%;">Edit</a>|<a href="detail_student.asp" style="margin-right: 0.5%; margin-left: 0.5%;">Detail</a>|<a href="delete_student.asp" style="margin-right: 0.5%;">Delete</a></td>
                    </tr>
                
                </table>

            </div>

        </div>

        <div class="container">
          
        </div>
    
    </body>
    
     <footer>
     <div class="container">
     <hr>
        <p>&copy; 2021 - My ASP.NET Application</p>
        </div>
    </footer>
    
</html>