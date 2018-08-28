<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<link href="/resources/bootstrap/signin.css" rel="stylesheet">

<body class="text-center">
<%--@elvariable id="messageToSend" type="pl.coderslab.entity.Message"--%>
<form:form class="form-signin" method="post" action="/message/new" modelAttribute="messageToSend">
    <form:hidden path="receiver" value="${receiver.id}"/>
    <form:hidden path="sender" value="${loggedUser.id}"/>
<h1 class="h3 mb-3 font-weight-normal">New message </h1>
<table>
    <tr>
        <th> From:</th>
        <td> ${loggedUser.username} </td>
    </tr>
    <tr>
        <th> To:</th>
        <td> ${receiver.username} </td>
    </tr>
    <tr>
        <th> Title</th>
        <td><form:input path="title" id="inputTitle" class="form-control"/></td>
    </tr>
    <tr>
        <td>Message</td>
        <td><form:textarea rows="10" path="text" name="text" id="inputPassword" class="form-control"/></td>
    </tr>
</table>

<button class="btn btn-lg btn-primary btn-block" type="submit">Send</button>

</form:form>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
