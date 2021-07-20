

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contoso | Enrollment Create</title>
        <!-- #include file ="resource\boostrap.inc" --> 
    </head>
    <body>
        <!-- #include file ="resource\header.inc" --> 
        <div class="p-4 container">
            <h2>Add Enrollments</h2>
            <h4>Enrollment</h4>
            <hr>
                <form action="input_enrollment.asp" method="POST">
                    <table>
                        <tr>
                            <td class="col-md-4" style="width: 193px; font-weight: bold; text-align: right;">Title</td>
                            <td Class="col-md-7">
                                <select name="Title" class="form-control" id="Title">
                                    
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
                                    
                                </select>
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
                                <input type="submit" name="submit" Class="btn btn-primary" value="Input">
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






