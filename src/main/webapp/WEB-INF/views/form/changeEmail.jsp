<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<link href="/resources/bootstrap/signin.css" rel="stylesheet">

<body class="text-center">


<%--@elvariable id="user" type="pl.coderslab.entity.User"--%>
<form:form class="form-signin" method="post" action="/user/changeEmail" modelAttribute="user">
<h1 class="h3 mb-3 font-weight-normal">Update e-mail</h1>
<form:hidden path="username" value="${user.username}"/>
    <form:hidden path="password" value="${user.password}"/>
    <form:hidden path="id" value="${user.id}"/>
<div class="alert-warning text-center">
    <form:errors path="*"/>
</div>
<table>
    <tr>
        <td> New e-mail:</td>
        <td><form:input path="email" required="true"/></td>
    </tr>
    <tr>
        <td colspan="2">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Change</button>
        </td>
    </tr>
</table>
</form:form>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
