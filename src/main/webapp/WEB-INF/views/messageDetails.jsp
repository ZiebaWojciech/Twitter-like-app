<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<div class="jumbotron">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h2>Title: ${message.title}</h2>
            </div>
            <%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>
            <div class="card-body" style="word-break: break-all">
                <h2>${message.text}</h2>

            </div>
            <div class="card-footer">
                <p>Sent by: <a href="/user/${message.sender.id}/info">${message.sender.username}</a></p>
                <p><em>${message.sentTime.toGMTString()}</em></p>
                <br/>
                <c:if test="${loggedUser.id != message.sender.id}">
                    <a class="btn btn-primary" href="/message/${message.sender.id}/new"> Reply </a></p>
                </c:if>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
