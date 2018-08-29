<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<hr>
<h1 class="badge-dark"> Users found </h1>
<table class="table-striped" width="100%">
    <%--@elvariable id="user" type="pl.coderslab.entity.User"--%>
    <c:forEach items="${users}" var="user">
        <tr style="font-weight: bold">
            <td> <a href="/user/${user.id}/info">${user.username}</a> </td>
        </tr>
    </c:forEach>
</table>

<hr>
<h1 class="badge-dark"> Tweets found </h1>
<table class="table-striped" width="100%">
    <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
    <c:forEach items="${tweets}" var="tweet">
        <tr style="font-weight: bold">
            <td> <a href="/tweet/details/${tweet.id}">${tweet.text}</a> </td>
        </tr>
    </c:forEach>
</table>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
