<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new user</title>
</head>
<body>

<%--@elvariable id="user" type="pl.coderslab.entity.User"--%>
<form:form method="post" action="/user/register" modelAttribute="user">
    <form:errors path="*"/>
    <table>
        <tr>
            <td> Username:</td>
            <td><form:input path="username"/></td>
        </tr>
        <tr>
            <td> E-mail:</td>
            <td><form:input path="email"/></td>
        </tr>
        <tr>
            <td> Password :</td>
            <td><form:password path="password"/></td>
        </tr>
    </table>
    <input type="submit" value="Register"/>
</form:form>
</body>
</html>
