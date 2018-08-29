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
                <p>You tweeted so far ${loggedUser.tweets.size()} time(s)</p>
                <p>E-mail: ${loggedUser.email}  </p>
                <div class="container-fluid">
                    <a class="btn btn-outline-info btn-block" data-toggle="collapse" href="#changeEmail"
                       role="button"
                       aria-expanded="true" aria-controls="collapseExample">
                        Change password
                    </a>
                </div>
                <c:if test="${empty emailChangeMessage}">
                <div class="collapse" id="changeEmail">
                    </c:if>
                    <c:if test="${not empty emailChangeMessage}">
                    <div class="collapse.in" id="changeEmail">
                        </c:if>
                        <div class="card card-body">
                            <div class="alert-warning text-center">
                                <c:out value="${emailChangeMessage}" default=""/>
                            </div>
                            <form method="post" action="/user/emailChange">
                                <table>
                                    <tr>
                                        <td>New email address: </td>
                                        <td><input type="text" name="newEmail"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="submit" class="btn-primary btn" value="Change"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div class="card-footer">

                    </div>
                </div>

                <div class="container-fluid">
                    <a class="btn btn-outline-info btn-block" data-toggle="collapse" href="#changePassword"
                       role="button"
                       aria-expanded="true" aria-controls="collapseExample">
                        Change password
                    </a>
                </div>
                <c:if test="${empty passwordChangeMessage}">
                    <div class="collapse" id="changePassword">
                </c:if>
                <c:if test="${not empty passwordChangeMessage}">
                    <div class="collapse.in" id="changePassword">
                    </c:if>
                    <div class="card card-body">
                        <div class="alert-warning text-center">
                            <c:out value="${passwordChangeMessage}" default=""/>
                        </div>
                            <form method="post" action="/user/changePassword">
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
                    </div>
                </div>
                <div class="card-footer">

                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/fragments/footer.jsp" %>
