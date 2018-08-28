<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>

<main role="main">
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">Hello, world!</h1>
            <div class="container">
                <div class="row">
                    <div class="col-md">
                        <p> Start tweeting with us NOW! </p>
                        <a class="btn btn-primary btn-lg" href="/login" role="button"> Login &raquo;</a>
                    </div>
                    <div class="col-md">
                        <p> Don't have account yet? </p>
                        <a class="btn btn-primary btn-lg" href="/register" role="button"> Register &raquo;</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="/WEB-INF/fragments/footer.jsp" %>

