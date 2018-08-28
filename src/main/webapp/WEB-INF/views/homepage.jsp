<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>

<main role="main">
    <div class="jumbotron">

        <div class="container">

            <!-- Example row of columns -->
            <div class="row">
                <div class="col-md-4">
                    <h2>Add new tweet</h2>
                    <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
                    <form:form method="post" action="/tweet/add" modelAttribute="tweet">
                    <p>
                        <form:errors path="*"/> <br/>
                        <form:hidden path="user" value="${loggedUser.id}"/>
                        <form:textarea path="text"/>
                    </p>
                    <p><button class="btn btn-primary" type="submit"> Tweet </button></p>
                    </form:form>
                    </p>
                </div>
                <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
                <c:forEach items="${allTweets}" var="tweet">
                    <div class="col-md-4" style="word-break: break-all">
                        <h2>${tweet.text}</h2>
                        <h3> by: <a href="/user/${tweet.user.id}/info">${tweet.user.username}</a></h3>
                        <p><em>${tweet.created}</em></p>
                        <p><a class="btn btn-secondary" href="/tweet/details/${tweet.id}" role="button">View details
                            &raquo;</a></p>
                    </div>
                </c:forEach>
            </div>
            <hr>
        </div>
    </div> <!-- /container -->
</main>
<%@include file="/WEB-INF/fragments/footer.jsp" %>

