<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>"Papryka" - umowy</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="includes/js/jquery.min.js"></script>
        <script src="includes/js/semantic.min.js"></script>
        <script src="includes/js/jquery.simple-dtpicker.js"></script>
        <script type="text/javascript" src="includes/js/jquery-ui.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/datatables.js"></script>
        <script type="text/javascript" src="includes/js/picker.js"></script>
        <script type="text/javascript" src="includes/js/picker.date.js"></script>
        <script type="text/javascript" charset="utf8" src="includes/js/validator.js"></script>
        <link rel="stylesheet" href="includes/css/custom.css">
        <link rel="stylesheet" href="includes/css/semantic.min.css">
        <link rel="stylesheet" href="includes/css/jquery-ui.css">
        <link rel="stylesheet" href="includes/css/default.css">
        <link rel="stylesheet" href="includes/css/default.date.css">
        <link rel="stylesheet" href="includes/css/jquery.simple-dtpicker.css">
        <link rel="stylesheet" type="text/css" href="includes/css/datatables.css">
        <!--<link rel='stylesheet prefetch' href='includes/css/icon.min.css'>-->
        <style>
            #result {
                position: absolute;
                width: 100%;
                max-width:870px;
                cursor: pointer;
                overflow-y: auto;
                max-height: 400px;
                box-sizing: border-box;
                z-index: 1001;
            }
            .link-class:hover{
                background-color:#f1f1f1;
            }
        </style>
    </head>
    <body>
        <div class="naglowek">
            <jsp:include page="/WEB-INF/JSP/menu.jsp" />
        </div>
        <br>
        <div class="container" id="kaf">
            <div class="row">
                <h2><img src="includes/img/logo.png" id="logo"/><br>System zarządzania umowami "Papryka"</h2>
                <hr>
            </div>
        </div>
        <div class="ui container">
            
            <form:form class="ui form" method="POST" action="zapisz-dodawanie-umowy.do" commandName="umowy" id="dodajUmowe">
                <form:hidden path="aktywny" value="true"></form:hidden>
                    <h2 class="ui dividing header">Dodaj umowę</h2>                
                    <div class="field">     
                        <label>System</label>
                        <div class="fields">

                            <div class="sixteen wide field">
                            <form:select path="system" class="ui fluid dropdown" id="system">                                
                                <form:option value=" "> </form:option>
                                <form:option value=" ">2</form:option>
                                <%--<c:forEach items="${slownikOrganizatorzy}" var="s">--%>
                                <%--<form:option value="${s.symbolOrganizatorzy}">${s.nazwaOrganizatorzy}</form:option>--%>
                                <%--</c:forEach>--%>                          
                            </form:select>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <div class="fields">
                        <div class="eight wide field">
                            <label>Zapotrzebowanie</label>
                            <form:input path="zapotrzebowanie" type="number" autocomplete="off"/>
                        </div>
                        <div class="eight wide field">
                            <label>Numer zamówienia</label>
                            <form:input path="nrZamowienia" type="text" autocomplete="off"/>
                        </div>                      
                    </div>
                </div>
                <div class="field">
                    <div class="fields">
                        <div class="eight wide field">
                            <label>Data rozpoczęcia ważności umowy:</label>
                            <form:input path="dataPoczatek" type="text" class="date_foo" autocomplete="off"/>
                        </div>
                        <div class="eight wide field">
                            <label>Data zakończenia ważności umowy:</label>
                            <form:input path="dataKoniec" type="text" class="date_foo" autocomplete="off"/>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <div class="fields">
                        <div class="four wide field">
                            <label>Kwota obciążenia</label>
                            <form:input path="kwota" type="number" autocomplete="off"/>
                        </div>
                        <div class="four wide field">
                            <label>Typ kwoty</label>
                            <form:select path="typKwota" class="ui fluid dropdown" id="typKwoty">                                
                                <form:option value=" "> </form:option>
                                <form:option value="NET">Netto</form:option>
                                <form:option value="BRU">Brutto</form:option>
                            </form:select>
                        </div>   
                        <div class="four wide field">
                            <label>Okres rozliczeniowy</label>
                            <form:select path="okres" class="ui fluid dropdown" id="typKwoty">                                
                                <form:option value=" "> </form:option>
                                <form:option value="MONTH">Miesiąc</form:option>
                                <form:option value="QUARTER">Kwartał</form:option>
                                <form:option value="YEAR">Rok</form:option>
                            </form:select>
                        </div>
                        <div class="four wide field">
                            <label>Procent upoważnienia</label>
                            <form:input path="procent" type="number" autocomplete="off"/>
                        </div> 
                    </div>
                </div>

                <div class="fields">
                    <div class="sixteen wide field">
                        <a href="start.do" class="ui button">Wstecz</a>
                    </div>
                    <span id="akceptuj" class="ui blue button">Zatwierdź</span>
                </div>
            </form:form>
        </div>       
        <script type="text/javascript" charset="utf8" src="includes/js/dodaj-umowe-walidacja.js"></script>
        <script>
                    $(document).keypress(
                    function (event) {
                    if (event.which == '13') {
                    event.preventDefault();
                    }
                    });        
        </script>

        <script>
                    $(function () {
                    $(".date_foo").pickadate({
                    monthsFull: ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'],
                            monthsShort: ['Sty', 'Lut', 'Mar', 'Kwi', 'Maj', 'Cze', 'Lip', 'Sie', 'Wrz', 'Paz', 'Lis', 'Gru'],
                            weekdaysFull: ['Niedziela', 'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota'],
                            weekdaysShort: ['Nd', 'Pon', 'Wt', 'Śr', 'Czw', 'Pt', 'Sob'],
                            showMonthsShort: undefined,
                            showWeekdaysFull: undefined,
                            today: 'Dzisiaj',
                            clear: 'Wyczyść',
                            close: 'Zamknij',
                            labelMonthNext: 'Następny miesiąc',
                            labelMonthPrev: 'Poprzedni miesiąc',
                            labelMonthSelect: 'Wybierz miesiąc',
                            labelYearSelect: 'Wybierz rok',
                            format: 'yyyy-mm-dd',
                            formatSubmit: undefined,
                            hiddenPrefix: undefined,
                            hiddenSuffix: '_submit',
                            hiddenName: undefined
                    });
                    });</script>
       
    </body>
</html>
