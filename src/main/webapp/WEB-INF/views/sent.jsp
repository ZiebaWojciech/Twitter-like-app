<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/fragments/header.jsp" %>
<hr>
    <div class="btn-group">
        <a href="/message/inbox" class="btn  btn-dark"><span data-feather="inbox"></span> Inbox
        </a>
        <a href="/message/sent" class="btn  btn-dark"><span data-feather="send"></span> Sent
        </a>
    </div>

<table class="table-striped" width="100%">
    <tr>
        <th width="15%">
            From
        </th>
        <th width="30%">
            Title
        </th>
        <th width="30%">
            Message
        </th>
        <th>
            Date
        </th>
    </tr>
    <%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>
    <c:forEach items="${sentMessages}" var="message">
        <c:choose>
            <c:when test="${message.read == false}">
                <tr style="font-weight: bold">
            </c:when>
            <c:when test="${message.read == true}">
                <tr>
            </c:when>
        </c:choose>
        <td>
                ${message.sender.username}
        </td>
        <td>
            <a href="/message/show/${message.id}">${message.title}</a>
        </td>
        <td>
            <c:choose>
                <c:when test="${message.text.length()<30}">
                    <a href="/message/show/${message.id}">${message.text}</a>
                </c:when>
                <c:when test="${message.text.length()>=30}">
                    <a href="/message/show/${message.id}">${message.text.substring(0,30)}(...)</a>
                </c:when>
            </c:choose>
        </td>
        <td>
                ${message.sentTime}
        </td>
        </tr>
    </c:forEach>
</table>
<%@include file="/WEB-INF/fragments/footer.jsp" %>
