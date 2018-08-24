<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All categories</title>
</head>
<body>
<%--@elvariable id="category" type="pl.coderslab.entity.Category"--%>

<ul>
    <c:forEach items="${categories}" var="category">
        <li> ${category.name} <a href="<c:url value="/category/edit"/>/${category.id}"> Edit </a>
            <a href="<c:url value="/category/delete"/>/${category.id}"> Delete </a>
            <ul> <li> ${category.description}</li></ul>
        </li>
    </c:forEach>

    <a href="<c:url value="/category/add"/>">Add new category</a>
</ul>
</body>
</html>
