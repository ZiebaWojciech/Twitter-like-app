<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<a href="/"> Homepage </a>
<h1> Message details</h1>
<%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>

<table>
    <tr>
        <td style="background-color: antiquewhite" colspan="2">
                ${message.title}
        </td>
    </tr>
    <tr>
        <td colspan="2">
            ${message.text}
        </td>
    </tr>
    <tr>
        <td>
            Username: ${message.sender.username}
        </td>
        <td>
            Sent: ${message.sentTime}
        </td>
    </tr>
</table>
<%--@elvariable id="reply" type="pl.coderslab.entity.Message"--%>
<form:form action="/message/new" method="post" modelAttribute="reply">
    <form:errors path="*"/>
    <form:hidden path="receiver" value="${message.sender.id}"/>
    <table>
        <tr>
            <td> To:</td>
            <td> ${message.sender.id} </td>
        </tr>
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
</html>
