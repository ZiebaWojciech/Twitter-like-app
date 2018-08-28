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
<c:if test="${not empty logoutSuccess}">
    <h1> ${logoutSuccess}</h1>
</c:if>
<br/>
<a href="/" class="btn"> Proceed </a>
</body>
</html>
