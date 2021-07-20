<%
        dim sqlUsername : sqlUsername = "sa"
        dim sqlPassword : sqlPassword = "Password123"
        dim ConnectionString : ConnectionString = "DRIVER={SQL Server};SERVER=DESKTOP-T0MS1O2;DATABASE=contoso_db;UID=" &sqlUsername&"; PWD="&sqlPassword&""
        Dim db
        set db = server.CreateObject("ADODB.Connection")
        db.Open connectionstring ,sqlUsername, sqlPassword

%>