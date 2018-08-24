<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new category</title>
</head>
<body>
    <%--@elvariable id="category" type="pl.coderslab.entity.Category"--%>
    <form:form method="post" action="/category/edit" modelAttribute="category">
        <form:input path="name"/>
        <form:textarea path="description"/>
        <input type="submit" value="Save"/>
    </form:form>
</body>
</html>
