<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>"Papryka" - umowy</title>
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
                <h3>Lista systemów</h3>
                <table class="ui celled structured table ui table ui striped table" id="lista-umow">
                    <thead>
                        <tr>
                            <th>Nazwa systemu</th>
                            <th>Data początku umowy</th>
                            <th>Data końca umowy</th>
                            <th>Akcja</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
        <script>
            $('#lista-umow').DataTable({
                "order": [[1, "desc"]],
                "processing": true,
                'ajax': {
                    'url': "lista-umow-ajax.do",
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
                    {"data": "system"},
                    {"data": "dataPoczatek"},
                    {"data": "dataKoniec"}
                ],
                "columnDefs": [
                    {
                        "targets": [3],
                        "data": {idSystemu: "idUmowy", aktywny: "aktywny"},
                        "render": function (data)
                        {
                            html = '<div class="ui buttons"><a href=edytuj-umowe.do?id=' + data.idUmowy + ' class="ui blue button">Podgląd</a>';
                            if (data.aktywny == true) {
                                html += '<div class="or" data-text="lub"></div><a href=anuluj-umowe.do?id=' + data.idUmowy + ' class="ui red button">Anuluj</a>';
                            }
                            return html;
                        }
                    }
                ],
                "rowCallback": function (row, data) {                       
                        if (data.aktywny == false) {
                            $(row).css('background-color', '#FFA1A1');
                        }
                    }
            });
        </script>
    </body>
</html>
