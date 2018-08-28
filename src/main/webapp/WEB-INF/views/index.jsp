<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp"%>



<main role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">Hello, world!</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>

        <hr>

    </div> <!-- /container -->

</main>



<%--@elvariable id="loggedUser" type="pl.coderslab.entity.User"--%>

<c:choose>
    <c:when test="${not empty loggedUser}">
        <h2>You are logged as: ${loggedUser.username} <a href="/logout" class="btn">Log out</a></h2>
    </c:when>
    <c:when test="${empty loggedUser}">
        <h2><a href="/login" class="btn">Log in</a></h2>
    </c:when>
</c:choose>
<c:if test="${not empty loginSuccess}">
    <h1> ${loginSuccess}</h1>
</c:if>
<c:if test="${not empty logoutSuccess}">
    <h1> ${logoutSuccess}</h1>
</c:if>
<table>
    <tr>
        <th>User</th>
        <th>Tweet</th>
        <th>Created</th>
        <th></th>
    </tr>
    <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
    <c:forEach items="${tweets}" var="tweet">
        <tr>
            <td><a href="/user/${tweet.user.id}/info">${tweet.user.username}</a> </td>
            <td>${tweet.text}</td>
            <td>${tweet.created}</td>
            <td><a href="/tweet/details/${tweet.id}"> Details </a></td>
        </tr>
    </c:forEach>
</table>
<a href="/tweet/add" class="btn"> Add new tweet </a>
<br/>
<a href="/message/inbox" class="btn">Inbox</a>
<br/>
<a href="/login" class="btn"> Login </a>
<br/>
<a href="/user/panel" class="btn"> User Panel </a>
<%@include file="/WEB-INF/fragments/footer.jsp"%>

