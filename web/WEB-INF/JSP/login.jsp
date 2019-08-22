<%-- 
    Document   : login
    Created on : 2018-05-23, 09:32:59
    Author     : Majk
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logowanie</title>
    </head>
    <body>
        <h1>Wprowadź dane do uwierzytelnienia</h1>
        <form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
            <table>
                <tr>
                    <td>Login:</td>
                    <td><input type='text' name='username' value=''></td>
                </tr>
                <tr>
                    <td><input type='hidden' name='password' value="test"/></td>
                </tr>
                <tr>
                    <td ><input name="submit" type="submit"
                                value="submit" /></td>

                    <td>                       
                </td>

                </tr>
            </table>

            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form>
    </body>
</html>
