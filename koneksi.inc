<%

        dim sqlUsername : sqlUsername = "GUNN-002"
        dim sqlPassword : sqlPassword = ""
        dim ConnectionString : ConnectionString = "DRIVER={SQL Server};SERVER=GUNN-002;DATABASE=Contoso_DB;UID=" &sqlUsername&"; PWD="&sqlPassword&""
        Dim db
        set db = server.CreateObject("ADODB.Connection")
        db.Open connectionstring ,sqlUsername, sqlPassword


        set rs=db.Execute("select * from student")


    %>