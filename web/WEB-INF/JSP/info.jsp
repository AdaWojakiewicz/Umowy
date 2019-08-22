<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>"Papryka" - o aplikacji</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="includes/css/custom.css">
        <link rel="stylesheet" href="includes/css/semantic.min.css">
    </head>
    <body>
        <div class="naglowek">
            <jsp:include page="/WEB-INF/JSP/menu.jsp" />
        </div>
        <br>
        <div class="row">
            <h2 style="text-align: center;">Witaj ${login}</h2>
            <hr>
        </div>
        <br>
        <h3 style="text-align: center;">Cieszę się, że korzystasz z mojej aplikacji. Ja nazywam się Ada Wojakiewicz i możesz
        się ze mną skontaktować mailowo pod adresem ada.wojakiewicz@gmail.com</h3>
        <h5 style="text-align: center;">Aplikacja powstała między 14 a 28 sierpnia 2019 roku.</h5>
    </body>
</html>
