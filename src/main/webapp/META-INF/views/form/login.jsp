<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<c:if test="${not empty registrationSuccess}">
    <h1> ${registrationSuccess}</h1>
</c:if>
<c:if test="${not empty loginSuccess}">
    <h1> ${loginSuccess}</h1>
</c:if>
<c:if test="${not empty loginFailure}">
    <h1> ${loginFailure}</h1>
</c:if>
<form method="post" action="/user/login">

    <table>
        <tr>
            <td> Username:</td>
            <td><input type="text" name="username"/></td>
        </tr>
        <tr>
            <td> Password</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Login"/>
            </td>
        </tr>
    </table>

</form>


<a href="/user/register" class="btn"> Register </a>
</body>
</html>
