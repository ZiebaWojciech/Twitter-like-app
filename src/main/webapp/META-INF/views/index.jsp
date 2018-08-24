<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All categories</title>
</head>
<body>

<ul>
    <li>
        <a href="<c:url value="/category/list"/>"> Categories </a>
    </li>
    <li>
        <a href="<c:url value="/author/list"/>">Authors</a>
    </li>
</ul>
</body>
</html>
