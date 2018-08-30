<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<div class="jumbotron">
    <div class="container-fluid">
        <div class="card">
            <%--@elvariable id="loggedUser" type="pl.coderslab.entity.User"--%>
            <div class="card-header">
                <h2>User: ${loggedUser.username}</h2>
            </div>
            <div class="card-body" style="word-break: break-all">
                <p>You tweeted ${loggedUser.tweets.size()} time(s) so far</p>
                <p>E-mail: ${loggedUser.email}  </p>
                <div class="alert-warning text-center">
                    <c:out value="${emailChangeMessage}" default=""/>
                </div>
                <div class="container-fluid">
                    <a class="btn btn-outline-info btn-block" href="/user/changeEmail"
                       role="button">
                        Change e-mail
                    </a>
                </div>
                <div class="alert-warning text-center">
                    <c:out value="${passwordChangeMessage}" default=""/>
                </div>
                <div class="container-fluid">
                    <a class="btn btn-outline-info btn-block" href="/user/changePassword"
                       role="button">
                        Change password
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
