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
    <%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>

    <c:forEach items="${receivedMessages}" var="message">
        <c:choose>
            <c:when test="${message.read == false}">
                <tr style="font-weight: bold">
            </c:when>
            <c:when test="${message.read == true}">
                <tr>
            </c:when>
        </c:choose>
        <td>
                ${message.sender.username}
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
</body>
</html>