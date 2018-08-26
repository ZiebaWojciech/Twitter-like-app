<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<h1> Twitter</h1>
<%--@elvariable id="loggedUser" type="pl.coderslab.entity.User"--%>

<c:choose>
    <c:when test="${not empty loggedUser}">
        <h2>You are logged as: ${loggedUser.username} <a href="/user/logout" class="btn">Log out</a></h2>
    </c:when>
    <c:when test="${empty loggedUser}">
        <h2><a href="/user/login" class="btn">Log in</a></h2>
    </c:when>
</c:choose>
<c:if test="${not empty loginSuccess}">
    <h1> ${loginSuccess}</h1>
</c:if>
<c:if test="${not empty logoutSuccess}">
    <h1> ${logoutSuccess}</h1>
</c:if>
<table>
    <tr>
        <th>User</th>
        <th>Tweet</th>
        <th>Created</th>
        <th></th>
    </tr>
    <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
    <c:forEach items="${tweets}" var="tweet">
        <tr>
            <td>${tweet.user.username}</td>
            <td>${tweet.text}</td>
            <td>${tweet.created}</td>
            <td><a href="/tweet/details/${tweet.id}"> Details </a></td>
        </tr>
    </c:forEach>
</table>
<a href="/tweet/add" class="btn"> Add new tweet </a>
<br/>
<a href="/message/inbox" class="btn">Inbox</a>
<br/>
<a href="/login" class="btn"> Login </a>
<br/>
<a href="/user/panel" class="btn"> User Panel </a>
</body>
</html>
