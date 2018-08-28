<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<div class="jumbotron">
    <div class="container-fluid">
        <div class="row">
            <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
            <div class="alert alert-dark" style="word-break: break-all">
                <h2>${tweet.text}</h2>
                <p>by: <a href="/user/${tweet.user.id}">${tweet.user.username}</a></p>
                <p>Created: <em>${tweet.created.toGMTString()}</em></p>
            </div>
        </div>
    </div>
</div>
<%--@elvariable id="comment" type="pl.coderslab.entity.Comment"--%>
<form:form method="post" action="/comment/add" modelAttribute="comment">
    <div class="card">
        <div class="card-header">
            Add new comment:
            <button type="submit" class="btn btn-primary"> Comment</button>
        </div>
        <div class="card-body" style="wi">
            <form:errors path="*"/>
            <form:hidden path="commentedTweet" value="${tweet.id}"/>
            <form:hidden path="author" value="${loggedUser.id}"/>
             <form:textarea path="commentText" cols="all"/>
        </div>
    </div>
</form:form>
<%--@elvariable id="comment" type="pl.coderslab.entity.Comment"--%>
<c:forEach items="${comments}" var="comment">
    <div class="card">
        <div class="card-header">
            Commented by: <a href="/user/${comment.author.id}/info">${comment.author.username}</a> on ${comment.created.toGMTString()}
        </div>
        <div class="card-body">
                ${comment.commentText}
        </div>
    </div>
</c:forEach>

<%@include file="/WEB-INF/fragments/footer.jsp" %>

