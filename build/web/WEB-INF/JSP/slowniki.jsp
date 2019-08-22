<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>"Papryka" - klienci</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="includes/js/jquery.min.js"></script>
        <script src="includes/js/semantic.min.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/datatables.js"></script>
        <link rel="stylesheet" href="includes/css/custom.css">
        <link rel="stylesheet" href="includes/css/semantic.min.css">
        <link rel="stylesheet" type="text/css" href="includes/css/datatables.css">        
    </head>
    <body>
        <div class="naglowek">
            <jsp:include page="/WEB-INF/JSP/menu.jsp" />
        </div>
        <br>
        <div class="ui container" id="kaf">
            <div class="row">
                <h2><img src="includes/img/logo.png" id="logo"/><br>System zarządzania umowami "Papryka"</h2>
                <hr>
            </div>
            <br>
            <div class="row">
                <h3>Dodaj nowego klienta</h3>
                <form:form class="ui form" method="POST" action="dodaj-klienta.do" commandName="nowyKlient">
                    <div class="field">
                        <div class="fields">
                            <div class="fourteen wide field">
                                <label>Nazwa klienta</label>
                                <form:input type="text" name="" path="nazwaKlienta" placeholder="" autocomplete="off"/>
                            </div>                        
                            <div class="two wide field">
                                <label><br></label>
                                <button type="submit" class="ui blue button">Dodaj</button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="row">
                <h3>Lista klientów</h3>
                <table class="ui celled structured table ui table ui striped table" id="lista-klientow">
                    <thead>
                        <tr>
                            <th>Nazwa klienta</th>                        
                            <th>Akcja</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
        <script>
            $('#lista-klientow').DataTable({
                    "order": [[0, "desc"]],
                    "processing": true,
                    'ajax': {
                        'url': "lista-klientow-ajax.do",
                        'dataSrc': ""
                    }, "language": {
                        "decimal": ",",
                        "thousands": ",",
                        "sProcessing": "Przetwarzanie...",
                        "sLengthMenu": "",
                        "sZeroRecords": "Nie znaleziono pasujących pozycji",
                        "sInfoThousands": " ",
                        "sInfo": " ",
                        "sInfoEmpty": "Pozycji 0 z 0 dostępnych",
                        "sInfoFiltered": "",
                        "sInfoPostFix": "",
                        "sSearch": "Szukaj:",
                        "sUrl": "",
                        "oPaginate": {
                            "sFirst": "Pierwsza",
                            "sPrevious": "Poprzednia",
                            "sNext": "Następna",
                            "sLast": "Ostatnia"
                        }
                    },
                    "columns": [
                        {"data": "nazwaKlienta"}
                    ],
                    "columnDefs": [                        
                        {
                            "targets": [1],
                            "data": {idKlienta: "idKlienta"},
                            "render": function (data)
                            {
                                html = '<div class="ui buttons"><a href=usun-klienta.do?id=' + data.idKlienta + ' class="ui red button">Usuń</a>';                                
                                return html;
                            }
                        }
                    ]                    
                });
        </script>
    </body>
</html>
