<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new category</title>
</head>
<body>
    <%--@elvariable id="category" type="pl.coderslab.entity.Category"--%>
    <form:form method="post" action="/category/delete" modelAttribute="category">
        <form:hidden path="id" value="${category.id}"/>
        <input type="submit" value="Send"/>
        <a href="/category/list"> Cancel </a>

    </form:form>
</body>
</html>
