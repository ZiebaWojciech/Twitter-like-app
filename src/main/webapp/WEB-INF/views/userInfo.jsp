<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<hr/>
<h1>User: ${user.username}
    <c:if test="${loggedUser.id != user.id}">
        <a href="/message/${user.id}/new" class="btn btn-primary"> Send message</a>
    </c:if>
</h1>
<main role="main">
    <div class="jumbotron">
        <div class="container">
            <!-- Example row of columns -->
            <div class="row">
                <c:if test="${empty userTweets}">
                    <div class="col-md-4 alert alert-dark" style="word-break: break-all">
                        <h2>You have no tweets yet</h2>
                    </div>
                </c:if>
                <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
                <c:forEach items="${userTweets}" var="tweet">
                    <div class="col-md-4 alert alert-dark" style="word-break: break-all">
                        <h2>${tweet.text}</h2>
                        <p>Created: <em>${tweet.created.toGMTString()}</em></p>
                        <p>Comments (${tweet.comments.size()}) <a class="btn btn-secondary" href="/tweet/details/${tweet.id}" role="button">
                            View details&raquo;</a></p>
                    </div>
                </c:forEach>
            </div>
            <hr>
        </div>
    </div> <!-- /container -->
</main>
<%@include file="/WEB-INF/fragments/footer.jsp" %>

