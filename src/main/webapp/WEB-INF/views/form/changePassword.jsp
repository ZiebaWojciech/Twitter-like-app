<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<link href="/resources/bootstrap/signin.css" rel="stylesheet">

<body class="text-center">
<div class="alert-warning text-center">
    <c:out value="${passwordChangeMessage}" default=""/>
</div>
<form method="post" action="/user/changePassword" class="form-signin">
    <h1 class="h3 mb-3 font-weight-normal">Change password</h1>

    <table>
        <tr>
            <td>Old password:</td>
            <td><input type="password" name="oldPassword"/></td>
        </tr>
        <tr>
            <td>New password:</td>
            <td><input type="password" name="newPassword"/></td>
        </tr>
        <tr>
            <td>Repeat new password:</td>
            <td><input type="password" name="newPasswordRepeated"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" class="btn-primary btn" value="Change"/>
            </td>
        </tr>
    </table>
</form>

<%@include file="/WEB-INF/fragments/footer.jsp" %>
