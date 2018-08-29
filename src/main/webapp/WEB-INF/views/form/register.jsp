<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new user</title>
</head>
<body>


</body>
</html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<link href="/resources/bootstrap/signin.css" rel="stylesheet">

<body class="text-center">
<%--@elvariable id="user" type="pl.coderslab.entity.User"--%>
<form:form class="form-signin" method="post" action="/register" modelAttribute="user">
<h1 class="h3 mb-3 font-weight-normal">Please sign up</h1>
<div class="badge badge-warning">
    <form:errors path="*"/>
</div>
<table>
    <tr>
        <td> Username:</td>
        <td><form:input path="username" required="true"/></td>
    </tr>
    <tr>
        <td> E-mail:</td>
        <td><form:input path="email" required="true"/></td>
    </tr>
    <tr>
        <td> Password :</td>
        <td><form:password path="password" required="true"/></td>
    </tr>
    <tr>
        <td colspan="2">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
        </td>
    </tr>
</table>
</form:form>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
