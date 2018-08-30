<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<link href="/resources/bootstrap/signin.css" rel="stylesheet">

<body class="text-center">
<form class="form-signin" method="post" action="/login">
    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <div class="badge-warning">
        <c:out value="${loginFailure}" default=""/>
    </div>
    <label for="inputUsername" class="sr-only">Email address</label>
    <input type="text" id="inputUsername" name="username" class="form-control" placeholder="Username" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <%--<div class="checkbox mb-3">--%>
        <%--<label>--%>
            <%--<input type="checkbox" value="remember-me"> Remember me--%>
        <%--</label>--%>
    <%--</div>--%>

    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">Don't have account yet? <a href="/register"> Sign up </a> </p>

</form>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
