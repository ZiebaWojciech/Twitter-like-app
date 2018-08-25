<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<h1> Twitter</h1>
<c:if test="${not empty loginSuccess}">
    <h1> ${loginSuccess}</h1>
</c:if>
<c:if test="${not empty loggedUser}">
    <h1> ${loggedUser.username}</h1>
</c:if>
<table>
    <tr>
        <th>User</th>
        <th>Tweet</th>
        <th>Created</th>
    </tr>
    <c:forEach items="${tweets}" var="tweet">
        <tr>
            <td>${tweet.user.username}</td>
            <td>${tweet.text}</td>
            <td>${tweet.created}</td>
        </tr>
    </c:forEach>
</table>
<a href="/tweet/add" class="btn"> Add new tweet </a>

<a href="/user/login" class="btn"> Login </a>
</body>
</html>
