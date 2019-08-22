

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baza turystyczna JSU</title>
    </head>
    <body>
        <div class="ui stackable menu">
            <div class="ui container">
                <a class="item" href="start.do"> 
                    <img src="includes/img/menu.png" class="icon"/> Menu główne
                </a>
                <a class="item" href="lista-umow.do">
                    <img src="includes/img/list.png" class="icon"/> Lista umów
                </a>
                <a class="item" href="lista-systemow.do">
                    <img src="includes/img/user.png" class="icon"/> Lista systemów
                </a>                
                <a class="item" href="slowniki.do">
                    <img src="includes/img/book.png" class="icon"/> Słowniki
                </a>
                <a class="item" href="o-aplikacji.do">
                    <img src="includes/img/help.png" class="icon"/> O aplikacji
                </a>
                <div class="right item">
                    <div class="ui label main-color">Zalogowany jako: ${login}</div>
                </div>
            </div>
        </div>
    </body>
</html>
