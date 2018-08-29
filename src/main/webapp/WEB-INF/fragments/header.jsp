<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Twitter-like Workshop App</title>


    <!-- Bootstrap core CSS -->
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>
    <link type="text/css" href="/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link type="text/css" href="/resources/bootstrap/jumbotron.css" rel="stylesheet">
    <style>
        textarea {
            width: 100%
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="/">Twitter</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <c:choose>
                <c:when test="${not empty loggedUser}">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">
                            <span data-feather="home"></span>
                            Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/message/inbox">
                            <span data-feather="message-square"></span>
                            Messages </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false">
                            <span data-feather="user"></span>
                            Your profile</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <a class="dropdown-item" href="/user/${loggedUser.id}/info">
                                <span data-feather="info"></span>
                                Profile info</a>
                            <a class="dropdown-item" href="/user/edit">
                                <span data-feather="settings"></span>
                                Edit your profile</a>
                            <a class="dropdown-item" href="/user/logout">
                                <span data-feather="log-out"></span>
                                Logout</a>
                        </div>
                    </li>
                </c:when>
                <c:when test="${empty loggedUser}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false">
                            <span data-feather="user"></span>
                            Your profile</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown02">
                            <a class="dropdown-item" href="/login">
                                <span data-feather="log-in"></span>
                                Login</a>
                            <a class="dropdown-item" href="/register">
                                <span data-feather="save"></span>
                                Register</a>
                        </div>
                    </li>
                </c:when>
            </c:choose>
        </ul>

        <form class="form-inline my-2 my-lg-0" action="/search" method="post">
            <input class="form-control mr-sm-2" type="text" placeholder="Search user/tweets" name="searchPhrase" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <c:if test="${not empty loggedUser}">
            <div class="text-white">
                You're logged as: ${loggedUser.username}
                <a class="nav-item" href="/user/logout">
                    <span data-feather="log-out"></span>
                    Logout</a>
            </div>

        </c:if>

    </div>
</nav>
</html>