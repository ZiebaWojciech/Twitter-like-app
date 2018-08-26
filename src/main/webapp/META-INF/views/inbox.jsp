<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<a href="/"> Homepage </a>
<h1>Inbox</h1>
<table>
    <tr>
        <td>
            From
        </td>
        <td>
            Title
        </td>
        <td>
            Date
        </td>
    </tr>
    <c:forEach items="${receivedMessages}" var="message">
        <c:choose>
            <c:when test="${message.isRead = true}">
                <tr style="font-style: oblique">
            </c:when>
            <c:when test="${message.isRead = false}">
                <tr>
            </c:when>
        </c:choose>
        <td>
                ${message.sender}
        </td>
        <td>
              <a href="/message/show/${message.id}">${message.title}</a>
        </td>
        <td>
                ${message.sentTime}
        </td>
        </tr>
    </c:forEach>
</table>

<%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>
<%--@elvariable id="receivers" type="pl.coderslab.entity.User"--%>
<form:form action="/message/new" method="post" modelAttribute="message">
    <form:errors path="*"/>

    <table>
        <tr>
            <td> To:</td>
            <td><form:select items="${receivers}" itemValue="id" itemLabel="username" path="receiver"/></td>
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