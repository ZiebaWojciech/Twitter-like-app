<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<h1> User info</h1>
<c:if test="${not empty loggedUser}">
    <h1> Hello ${loggedUser.username}</h1>
</c:if>

<h1>${user.username}</h1>
<c:if test="${loggedUser.id != user.id}">
    <h2><a href="/message/${user.id}/new">Send message</a></h2>

</c:if>
<table>
    <tr>
        <th>Tweet</th>
        <th>Created</th>
    </tr>
    <tr>
        <c:if test="${empty userTweets}">
            <h2>You have no tweets yet</h2>
        </c:if>
    </tr>
    <c:forEach items="${userTweets}" var="tweet">
        <tr>
            <td>${tweet.text}</td>
            <td>${tweet.created}</td>
        </tr>
    </c:forEach>
</table>
<a href="/tweet/add" class="btn"> Add new tweet </a>

<a href="/user/login" class="btn"> Login </a>
</body>
</html>
