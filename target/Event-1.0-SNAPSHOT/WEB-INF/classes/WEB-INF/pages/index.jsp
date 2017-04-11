

<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/1/2017
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri ="http://www.springframework.org/security/tags"%>

<html>
<head>
    <META NAME="description" CONTENT="Данный сайт содержит информацию">
    <META NAME="keywords" CONTENT="информация, событие, event, поиск">
    <META NAME="Document-state" CONTENT="Dynamic">
    <META NAME="AUTHOR" CONTENT="A-Nosenko">
    <title>==EVENT_MAP==</title>
    <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
    <style type="text/css">
        span.error {
            color: orangered;
        }
    </style>
</head>
<body>

<div align="center">
    <a href="/app"><img src="resources/images/index.gif" alt="Welcome!"></a>
</div>

<div align="right">


<sf:form  action="/register" method="get">
    <button type="submit" class="button">Регистрация</button>
</sf:form>

    <br/>
    <c:if test = "${pageContext.request.remoteUser != null}" >
       Ваш логин:  <c:out value="${pageContext.request.remoteUser}       "/>
    <sf:form action="/logout" method="post">
        <button type= "submit" class="button">===Выйти===</button>
    </sf:form>
        <sf:form action="/account" method="post">
            <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button">_Мой аккаунт</button>
        </sf:form>
    </c:if>

    <c:if test = "${pageContext.request.remoteUser == null}" >
            <sf:form action="/login" method="get">
            <button type= "submit" class="button">=== Вход ===</button>
        </sf:form>
    </c:if>

    <sf:form  action="/app" method="get">
        <button type="submit" class="button">_EVENT MAP</button>
    </sf:form>

    <br/>
    <br/>
    <br/><br/><br/>
    <br/>
</div>

</body>
</html>
