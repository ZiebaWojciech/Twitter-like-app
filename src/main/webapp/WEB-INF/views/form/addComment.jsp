<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new comment</title>
</head>
<body>

<%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
<form:form method="post" action="/tweet/add" modelAttribute="tweet">
    <form:errors path="*"/>
    <table>
        <tr>
            <td> Text:</td>
            <td><form:input path="text"/></td>
        </tr>
    </table>
    <input type="submit" value="Tweet"/>
</form:form>
</body>
</html>
