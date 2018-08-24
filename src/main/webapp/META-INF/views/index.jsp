<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter</title>
</head>
<body>
<c:if test="${not empty success}">
    <h1> ${success}</h1>
</c:if>

<a href="/user/register" class="btn"> Register </a>
</body>
</html>
