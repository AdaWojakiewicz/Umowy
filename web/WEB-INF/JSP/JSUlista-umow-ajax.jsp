<%-- 
    Document   : lista
    Created on : 2019-01-23, 12:10:28
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Baza turystyczna JSU</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="includes/js/jquery.min.js"></script>
        <script src="includes/js/semantic.min.js"></script>
        <script type="text/javascript" src="includes/js/jquery-ui.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/datatables.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/moment.min.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/daterangepicker.js"></script>        
        <link rel="stylesheet" href="includes/css/custom.css">
        <link rel="stylesheet" href="includes/css/semantic.min.css">
        <link rel="stylesheet" href="includes/css/jquery-ui.css">
        <!--<link rel="stylesheet" href="includes/css/jquery.simple-dtpicker.css">-->
        <link rel="stylesheet" type="text/css" href="includes/css/datatables.css">
        <link rel="stylesheet" type="text/css" href="includes/css/daterangepicker.css">
        <!--<link rel='stylesheet prefetch' href='includes/css/icon.min.css'>-->
        <script src="includes/js/dataTables.fixedHeader.min.js"></script>
        <link rel="stylesheet" type="text/css" href="includes/css/datatables.min.css"/>
        <script type="text/javascript" src="includes/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="includes/js/jszip.min.js"></script>
        <script type="text/javascript" src="includes/js/pdfmake.min.js"></script>
        <script type="text/javascript" src="includes/js/buttons.print.min.js"></script>
        <script type="text/javascript" src="includes/js/vfs_fonts.js"></script>
        <script type="text/javascript" src="includes/js/buttons.html5.min.js"></script>
    </head>

    <body>
        <div class="naglowek">
            <!--<h2><img src="includes/img/logo.jpeg" id="logo"/></h2>-->
            <jsp:include page="/WEB-INF/JSP/menu.jsp" />
        </div>
        <br>
        <div class="row">
            <h2 style="text-align: center;">Baza turystyczna JSU</h2>
            <hr>
        </div>
        <br>
        <div class="ui placeholder segment">
            <div class="ui three column very relaxed stackable grid">
                <div class="column">
                    <div class="ui form">
                        <label>Wyszukaj po dacie sprzedaży: </label>
                        <br>
                        <input id="date_range" type="text" class="date_range" style="width: 300px;">
                    </div>
                </div>
                <div class="column">
                    <div class="ui form">
                        <label>Wyszukaj po dacie rozpoczęcia pobytu: </label>
                        <br>
                        <input id="date_range_start" type="text" class="date_range" style="width: 300px;">
                    </div>
                </div>
                <div class="column">
                    <div class="ui form">
                        <label>Wyszukaj po dacie zakończenia pobytu: </label>
                        <br>
                        <input id="date_range_end" type="text" class="date_range" style="width: 300px;">
                    </div>
                </div>
            </div>
        </div>
        <!--<span class="ui blue basic button" id="refresh" style="margin-left:15px;">Wyczyść daty</span>-->
        <div class="container">
            <div class="row" style="text-align: right; padding-right:20px;">
                <button id="hide" class="ui blue button">Pokaż bez anulowanych</button>
                <button id="reset" class="ui blue button">Pokaż wszystkie</button>
                <button id="z-wplata" class="ui blue button">Pokaż anulowane z wpłatą</button>
                <input type="hidden" value="${idRoli}" id="rola"/>
                <input type="hidden" value="${imie_nazwisko}" id="imie_i_nazwisko"/>
                <input type="hidden" value="${mojaAgencja}" id="moja_agencja"/>
                <input type="hidden" value="${nazwaAgencji}" id="nazwa_agencji"/>
            </div>
            <br><br>
            <table class="ui celled structured table ui table ui striped table" id="lista-umow-ajax">
                <thead>
                    <tr>
                        <th>Organizator</th>
                        <th>Agencja</th>
                        <th>Agent</th>
                        <th>Numer umowy</th>
                        <th>Zgoda_1</th>
                        <th>Zgoda_2</th>
                        <th>Zgoda_3</th>
                        <th>Rezygnacja</th>
                        <th>Nazwisko klienta</th>
                        <th>Imię klienta</th>
                        <th>Kraj zamieszkania</th>
                        <th>Kod pocztowy</th>
                        <th>Poczta</th>
                        <th>Miejscowość</th>
                        <th>Adres</th>
                        <th>Numer domu</th>
                        <th>Kierunkowy numer telefonu</th>
                        <th>Telefon</th>
                        <th>Email</th>
                        <th>Info</th>
                        <th>Oferta</th>
                        <th>Rabat</th>
                        <th>Data sprzedaży</th>
                        <th>Ośrodek turystyczny</th>
                        <th>Początek pobytu</th>
                        <th>Koniec pobytu</th>
                        <th>Liczba dni</th>
                        <th>Liczba dzieci ryczałt</th>
                        <th>Liczba dzieci połówka</th>
                        <th>Liczba osób</th>
                        <th>Liczba osobodni płatnych</th>
                        <th>Termin rozliczenia</th>
                        <th>Zaliczka</th>
                        <th>Sposób płatności zaliczki</th>
                        <th>Data zapłaty zaliczki</th>
                        <th>Numer KP</th>
                        <th>II Rata</th>
                        <th>Sposób płatności raty</th>
                        <th>Data zapłaty II raty</th>
                        <th>Prowizja Groupon</th>
                        <th>Dodatkowe wyżywienie</th>
                        <th>Cena sprzedaży</th>
                        <th>Przychód JSU</th>
                        <th>Stawka prowizja</th>
                        <th>Prowizja</th>
                        <th>Rok rozliczenia</th>
                        <th>Miesiąc rozliczenia</th>
                        <th>Numer rozliczenia</th>
                        <th>Zatwierdzono wpłatę</th>
                        <th>Zatwierdzono część wpłaty</th>
                        <th>Anulowano</th>
                        <th>Zablokowano</th>
                        <th>Akcja</th>
                    </tr>
                </thead>
            </table>
            <div class="ui modal">
                <i class="close icon"></i>
                <div class="header">
                    Anuluj umowę
                </div>
                <div class="content">
                    <p>Czy na pewno chcesz anulować umowę?</p>
                </div>
                <div class="actions">
                    <div class="ui button nie_anuluj">Nie</div>
                    <a id="tak" class="ui blue button">Tak</a>
                </div>
            </div>
        </div>
        <script>
            function anulujUmowe(x) {
                $('.ui.modal').modal('show');
                var a = document.getElementById('tak')
                a.href = "anuluj-umowe.do?id=" + x;
            }
            ;
            $('.nie_anuluj').click(function () {
                $('.ui.modal').modal('hide');
            });

        </script>
        <script>
            $(document).ready(function () {
                var rola = document.getElementById("rola").value;
                var mojaAgencja = document.getElementById("moja_agencja").value;
                var imie_i_nazwisko = document.getElementById("imie_i_nazwisko").value;
                var nazwaAgencji = document.getElementById("nazwa_agencji").value;
                var html;
                $('#lista-umow-ajax').DataTable({
                    "order": [[22, "desc"]],
                    "processing": true,
//                    "serverSide": true,
                    'ajax': {
                        'url': "pobierz_umowy.do",
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
                        {"data": "organizator"},
                        {"data": "agencja"},
                        {"data": "agentNazwisko"},
                        {"data": "numerUmowy"},
                        {"data": "zgoda1"},
                        {"data": "zgoda2"},
                        {"data": "zgoda3"},
                        {"data": "rezygnacja"},
                        {"data": "nazwiskoKlient"},
                        {"data": "imieKlient"},
                        {"data": "krajZamieszkania"},
                        {"data": "kodPocztowyKlient"},
                        {"data": "pocztaKlient"},
                        {"data": "miejscowoscKlient"},
                        {"data": "adresKlient"},
                        {"data": "numerDomuKlient"},
                        {"data": "kierunkowyNumerTelefonu"},
                        {"data": "telefonKlient"},
                        {"data": "emailKlient"},
                        {"data": "infoKlient"},
                        {"data": "oferta"},
                        {"data": "rabat"},
                        {"data": "dataSprzedazy"},
                        {"data": "osrodekTurystyczny"},
                        {"data": "poczatekPobytu"},
                        {"data": "koniecPobytu"},
                        {"data": "liczbaDni"},
                        {"data": "liczbaDzieciRyczalt"},
                        {"data": "liczbaDzieciPolowka"},
                        {"data": "liczbaOsob"},
                        {"data": "liczbaOsobodniPlatnych"},
                        {"data": "terminRozliczenia"},
                        {"data": "zaliczka"},
                        {"data": "sposobPlatnosciZaliczki"},
                        {"data": "dataZaliczki"},
                        {"data": "numerKp"},
                        {"data": "drugaRata"},
                        {"data": "sposobPlatnosciRaty"},
                        {"data": "dataRata"},
                        {"data": "prowizjaGrupon"},
                        {"data": "wyzywienieDodatkowe"},
                        {"data": "cena"},
                        {"data": "przychodJsu"},
                        {"data": "stawkaProwizja"},
                        {"data": "prowizja"},
                        {"data": "rokRozliczenia"},
                        {"data": "miesiacRozliczenia"},
                        {"data": "nrRozliczenia"},
                        {"data": "zatwierdzonoWplate"},
                        {"data": "zatwierdzonoCzescWplaty"},
                        {"data": "anulowano"},
                        {"data": "zablokowane"}
                    ],
                    "columnDefs": [
                        {
                            "targets": [4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                                21, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,
                                37, 38, 39, 40, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51],
                            "visible": false
                        },
                        {
                            "targets": [52],
                            "data": {idUmowy: "idUmowy", anulowano: "anulowano"},
                            "render": function (data, type, full, meta, anulowano)
                            {
                                html = '<div class="ui buttons"><a href=edytuj-umowe.do?id=' + data.idUmowy + ' class="ui yellow button">Edytuj</a>';
                                if (data.anulowano == false) {
                                    html += '<div class="or" data-text="lub"></div><button class="ui red button anulowanie_umowy" onclick="anulujUmowe(' + data.idUmowy + ')">Anuluj</button>';
                                }
                                if (data.zablokowane == false && rola == 1) {
                                    html += '<div class="or" data-text="lub"></div> <a href=zablokuj.do?id=' + data.idUmowy + ' class="ui blue button">Zablokuj edycję</a></div>';
                                }
                                return html;
                            }
                        }
                    ],
                    "rowCallback": function (row, data, index) {
//                        if (rola != 1 && rola != 3) {
//                            if (mojaAgencja == 'Ośrodek') {
//                                if (data.osrodekTurystyczny != null) {
//                                    if (data.osrodekTurystyczny != nazwaAgencji) {
//                                        $(row).hide();                                        
//                                    }
//                                }
//                            }
//                            if (mojaAgencja != 'Ośrodek') {
//                                if (imie_i_nazwisko != data.agentNazwisko) {
//                                    $(row).hide();
//                                }
//                            }
//                        }
                        if (data.anulowano == false && data.zablokowane == true) {
                            $(row).css('background-color', '#cee7fd');
                        }
                        else if (data.anulowano == true) {
                            $(row).css('background-color', '#FFA1A1');
                        }
                        else if (data.zatwierdzonoWplate == false && data.zatwierdzonoCzescWplaty == true && data.anulowano == false && data.zablokowane == false) {
                            $(row).css('background-color', '#FEFFAD');
                        }
                        else if (data.zatwierdzonoWplate == true && data.zatwierdzonoCzescWplaty == true && data.anulowano == false && data.zablokowane == false) {
                            $(row).css('background-color', '#C6F7C6');
                        }

                    },
                    "dom": 'lBfrtp',
                    "buttons": {
                        "dom": {
                            "button": {
                                "tag": "ui button",
                                "className": "ui blue button"
                            }
                        },
                        "buttons": [
                            {
                                "text": 'Eksportuj do Excel',
                                "extend": 'excelHtml5',
                                customize: function (xlsx) {
                                    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                                    $('row c[r^="C"]', sheet).attr('s', '2');
                                },
                                orientation: 'landscape',
                                exportOptions: {
                                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
                                        16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                                        31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45,
                                        46, 47, 48, 49, 50, 51]
                                }
                            },
                            {
                                "text": 'Eksportuj do CSV',
                                "extend": 'csvHtml5',
                                charset: 'utf-8',
                                bom: true,
                                fieldSeparator: ';',
                                fieldBoundary: '"',
                                header: true,
                                exportOptions: {
                                    orthogonal: 'export',
                                    "drawCallback": function (settings) {
                                        $("#selector thead").hide();
                                    },
                                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
                                        16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                                        31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45,
                                        46, 47, 48, 49, 50, 51],
                                    format: {
                                        body: function (data, row, column, node) {
                                            data = $('<p>' + data + '</p>').text();
                                            if (column != 14 && column != 18) {
                                                return data.replace('.', ',');
                                            }
                                            return data;
                                        }
                                    }
                                }
                            }
                        ]
                    },
                    'autoWidth': false,
                    'lengthChange': false,
                    'ordering': true,
                    'pageLength': 100
                });

                var dateRangeStart, dateRangeEnd;
                var dateRangeStart2, dateRangeEnd2;
                var dateRangeStart3, dateRangeEnd3;
                $(".date_range").daterangepicker({
                    autoUpdateInput: false,
                    locale: {
                        "cancelLabel": "Wyczyść",
                        format: 'YYYY-MM-DD',
                        "separator": " - ",
                        "applyLabel": "Szukaj",
                        "fromLabel": "Od",
                        "toLabel": "Do",
                        "customRangeLabel": "Custom",
                        "weekLabel": "W",
                        "daysOfWeek": [
                            "Nd",
                            "Pon",
                            "Wt",
                            "Śr",
                            "Czw",
                            "Pt",
                            "So"
                        ],
                        "monthNames": [
                            'Sty', 'Lut', 'Mar', 'Kwi', 'Maj', 'Cze', 'Lip', 'Sie', 'Wrz', 'Paz', 'Lis', 'Gru'
                        ]
                    }
                });

                $("#date_range").on('apply.daterangepicker', function (ev, picker) {
                    dateRangeStart = picker.startDate;
                    dateRangeEnd = picker.endDate;
                    console.log(dateRangeStart);
                    console.log(dateRangeEnd);
                    $(this).val(dateRangeStart.format('YYYY-MM-DD') + ' do ' + dateRangeEnd.format('YYYY-MM-DD'));
                    table.draw();
                });
                $("#date_range").on('cancel.daterangepicker', function (ev, picker) {
                    dateRangeStart = dateRangeEnd = null;
                    $(this).val('');
                    table.draw();
                });
                $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {

                    var inEmpStartingDateRange;
                    var empStartDate = Date.parse(data[22]);

                    inEmpStartingDateRange = (dateRangeStart && dateRangeEnd) ?
                            (moment(empStartDate).isSameOrAfter(dateRangeStart)
                                    && moment(empStartDate).isSameOrBefore(dateRangeEnd)) : true;
                    return inEmpStartingDateRange;
                });


                $("#date_range_start").on('apply.daterangepicker', function (ev, picker) {
                    dateRangeStart2 = picker.startDate;
                    dateRangeEnd2 = picker.endDate;
                    $(this).val(dateRangeStart2.format('YYYY-MM-DD') + ' do ' + dateRangeEnd2.format('YYYY-MM-DD'));
                    table.draw();
                });
                $("#date_range_start").on('cancel.daterangepicker', function (ev, picker) {
                    dateRangeStart2 = dateRangeEnd2 = null;
                    $(this).val('');
                    table.draw();
                });
                $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {

                    var inEmpStartingDateRange2;
                    var empStartDate2 = Date.parse(data[24]);

                    inEmpStartingDateRange2 = (dateRangeStart2 && dateRangeEnd2) ?
                            (moment(empStartDate2).isSameOrAfter(dateRangeStart2)
                                    && moment(empStartDate2).isSameOrBefore(dateRangeEnd2)) : true;
                    return inEmpStartingDateRange2;
                });


                $("#date_range_end").on('apply.daterangepicker', function (ev, picker) {
                    dateRangeStart3 = picker.startDate;
                    dateRangeEnd3 = picker.endDate;
                    $(this).val(dateRangeStart3.format('YYYY-MM-DD') + ' do ' + dateRangeEnd3.format('YYYY-MM-DD'));
                    table.draw();
                });
                $("#date_range_end").on('cancel.daterangepicker', function (ev, picker) {
                    dateRangeStart3 = dateRangeEnd3 = null;
                    $(this).val('');
                    table.draw();
                });
                $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {

                    var inEmpStartingDateRange3;
                    var empStartDate3 = Date.parse(data[25]);

                    inEmpStartingDateRange3 = (dateRangeStart3 && dateRangeEnd3) ?
                            (moment(empStartDate3).isSameOrAfter(dateRangeStart3)
                                    && moment(empStartDate3).isSameOrBefore(dateRangeEnd3)) : true;
                    return inEmpStartingDateRange3;
                });
                var table = $('#lista-umow-ajax').DataTable();
            });
        </script>
        <script>
            $(document).ready(function () {
                var table = $('#lista-umow-ajax').DataTable();

                table.draw();
                table = $('#lista-umow-ajax').DataTable();
                $("#hide").click(function () {

                    $.fn.dataTable.ext.search.pop();
                    table.draw();

                    $.fn.dataTable.ext.search.push(
                            function (settings, data, dataIndex) {
                                var anulowane = (data[50]);
                                console.log(anulowane);
                                if (anulowane == 'false')
                                {
                                    return true;
                                }
                                return false;
                            }
                    );
                    table.draw();
                });
                $("#z-wplata").click(function () {

                    $.fn.dataTable.ext.search.pop();
                    table.draw();

                    $.fn.dataTable.ext.search.push(
                            function (settings, data, dataIndex) {
                                var anulowane = (data[50]);
                                var czesc_wplaty = (data[49]);
                                var wplata = (data[48]);
                                if (anulowane == 'true' && (czesc_wplaty == 'true' || wplata == 'true'))
                                {
                                    console.log('Showing.... :)');
                                    return true;
                                }
                                return false;
                            }
                    );
                    table.draw();
                });
                $("#reset").click(function () {
                    $.fn.dataTable.ext.search.pop();
                    table.draw();
                });
                $('.daterangepicker').css('display', 'none');
            });</script>
    </body>
</html>
