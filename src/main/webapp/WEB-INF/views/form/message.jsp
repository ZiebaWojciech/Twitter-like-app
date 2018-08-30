<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<link href="/resources/bootstrap/signin.css" rel="stylesheet">

<body class="text-center" style="width: 100%">
<%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>
<form:form class="form-signin" method="post" action="/message/new" modelAttribute="message" cssStyle="max-width: 1000px">
    <form:hidden path="receiver" value="${receiver.id}"/>
    <form:hidden path="sender" value="${loggedUser.id}"/>
<h1 class="h3 mb-3 font-weight-normal">New message </h1>

<table width="100%">
    <tr>
        <th width="30%"> From:</th>
        <td> ${loggedUser.username} </td>
    </tr>
    <tr>
        <th> To:</th>
        <td> ${receiver.username} </td>
    </tr>
    <tr>
        <th> Title :
            <div class="badge-warning">
                <form:errors path="title"/>
            </div>
        </th>
        <td><form:input path="title" id="inputTitle" class="form-control" cssStyle="width: 100%"/></td>
    </tr>
    <tr>
        <th>Message:
            <div class="badge-warning">
                <form:errors path="text"/>
            </div>
        </th>
        <td><form:textarea rows="10" path="text" name="text" id="inputPassword" class="form-control" cssStyle="width: 100%"/></td>
    </tr>
</table>

<button class="btn btn-dark btn-block" type="submit">Send</button>

</form:form>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
