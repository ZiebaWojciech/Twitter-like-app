<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
From: ${loggedUser.id}
<br/>
To: ${receiver.id}
<br/>
<%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>
<form:form action="/message/new" method="post" modelAttribute="message">
    <form:errors path="*"/>
    <form:hidden path="receiver" value="${receiver.id}"/>
    <form:hidden path="sender" value="${loggedUser.id}"/>

    <table>
        <tr>
            <td> Title:</td>
            <td><form:input path="title"/></td>
        </tr>
        <tr>
            <td> Message:</td>
            <td><form:textarea path="text"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Send"></td>
        </tr>
    </table>
</form:form>
</body>
<head>
    <title>Add new comment</title>
</head>
</html>
