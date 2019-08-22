<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>"Papryka" - menu</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="includes/css/custom.css">
        <link rel="stylesheet" href="includes/css/semantic.min.css">
        <link rel='stylesheet prefetch' href='includes/css/icon.min.css'>
    </head>
    <body>
        <br>
        <div class="container" id="kaf">
            <div class="row">
                <h2><img src="includes/img/logo.png" id="logo"/><br>System zarządzania umowami "Papryka"</h2>
                <hr>
                <div style="padding-top: 30px;"></div>
                <div>
                    <a href="dodaj-umowe.do" class="kafelek ui blue button"> <img src="includes/img/plus.png" class="icon"/> <br><br>Dodaj umowę</a>
                    <a href="lista-umow.do" class="kafelek ui blue button"> <img src="includes/img/list.png" class="icon"/> <br><br>Lista umów</a>
                    <a href="lista-systemow.do" class="kafelek ui blue button"> <img src="includes/img/list.png" class="icon"/> <br><br>Lista systemów</a>
                    <a href="slowniki.do" class="kafelek ui blue button"> <img src="includes/img/user.png" class="icon"/> <br><br>Zarządzanie klientami</a>
                    <a href="o-aplikacji.do" class="kafelek ui blue button"> <img src="includes/img/help.png" class="icon"/> <br><br>O aplikacji</a>
                </div>
            </div>  
        </div>
    </body>
</html>
