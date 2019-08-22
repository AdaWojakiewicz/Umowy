<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>"Papryka" - systemy</title>
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
                <h3>Dodaj nowy system</h3>
                <form:form class="ui form" method="POST" action="dodaj-system.do" commandName="nowySystem">
                    <div class="field">
                        <div class="fields">
                            <div class="eight wide field">
                                <label>Nazwa systemu</label>
                                <form:input type="text" name="" path="nazwaSystemu" placeholder="" autocomplete="off"/>
                            </div>                        
                            <div class="eight wide field">
                                <label>Klient</label>
                                <form:select path="idKlienta" class="ui fluid dropdown" id="klient">                                
                                    <form:option value="0">-</form:option>
                                    <c:forEach items="${listaKlientow}" var="k">
                                        <form:option value="${k.idKlienta}">${k.nazwaKlienta}</form:option>
                                    </c:forEach>                          
                                </form:select>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="fields">
                            <div class="eight wide field">
                                <label>Opis systemu</label>
                                <form:textarea path="opisSystemu" placeholder="" autocomplete="off"/>
                            </div>                        
                            <div class="eight wide field">
                                <label>Opis technologii</label>
                                <form:textarea path="opisTechnologii" placeholder="" autocomplete="off"/>
                            </div>
                        </div>
                    </div>
                    <div class="fields">                    
                        <button type="submit" class="ui blue button">Zatwierdź</button>
                    </div>
                </form:form>
            </div>
            <div class="row">
                <h3>Lista systemów</h3>
                <table class="ui celled structured table ui table ui striped table" id="lista-systemow">
                    <thead>
                        <tr>
                            <th>Nazwa systemu</th>                        
                            <th>Akcja</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
        <script>
            $('#lista-systemow').DataTable({
                "order": [[0, "desc"]],
                "processing": true,
                'ajax': {
                    'url': "lista-systemow-ajax.do",
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
                    {"data": "nazwaSystemu"}
                ],
                "columnDefs": [
                    {
                        "targets": [1],
                        "data": {idSystemu: "idSystemu"},
                        "render": function (data)
                        {
                            html = '<div class="ui buttons"><a href=podglad-systemu.do?id=' + data.idSystemu + ' class="ui blue button">Podgląd</a>';
                            return html;
                        }
                    }
                ]
            });
        </script>
    </body>
</html>
