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
                <h3>System ${system.nazwaSystemu}</h3>
                <form:form class="ui form" method="POST" action="zapisz-edycje-umowy.do" commandName="umowy">
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
                            <a href="lista-umow.do" class="ui button">Wstecz</a>
                        </div>
                        <button type="submit" class="ui blue button">Zatwierdź</button>
                    </div>
                </form:form>
            </div>            
        </div>        
    </body>
</html>
