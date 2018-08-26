<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<a href="/"> Homepage </a>
<h1> Tweet details</h1>
<table>
    <tr>
        <td style="background-color: antiquewhite" colspan="2">
                ${tweet.text}
        </td>
    </tr>
    <tr>
        <td colspan="2">
            Created: ${tweet.created}
        </td>
    </tr>
    <tr>
        <td>
            Username: ${tweet.user.username}
        </td>
        <td>
            E-mail: ${tweet.user.email}
        </td>
    </tr>
</table>
<table>
    <tr>
        <th>
            Comment
        </th>
        <th>
            By
        </th>
        <th>
            Created
        </th>
    </tr>
    <c:forEach items="${comments}" var="comment">
        <tr>
            <td>
                    ${comment.commentText}
            </td>
            <td>
                    ${comment.author.username}
            </td>
            <td>
                    ${comment.created}
            </td>
        </tr>
    </c:forEach>
</table>
<%--@elvariable id="newComment" type="pl.coderslab.entity.Comment"--%>
<form:form method="post" action="/comment/add" modelAttribute="newComment">
    <form:errors path="*"/>
    <form:hidden path="commentedTweet" value="${tweet.id}"/>
    <table>
        <tr>
            <td> Comment: </td>
            <td><form:textarea path="commentText"/></td>
        </tr>
    </table>
    <input type="submit" value="Comment"/>
</form:form>
</body>
</html>
