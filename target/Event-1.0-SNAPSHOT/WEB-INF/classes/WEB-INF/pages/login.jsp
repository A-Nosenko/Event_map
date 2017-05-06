
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/15/2017
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<div align="left">
  <a href="/"><img src="resources/images/ref.gif"></a>
</div>

<div align = "right">

<c:if test = "${pageContext.request.remoteUser == null}">
  <form  action="/app" method="get">
    <button type="submit" class="button">EVENT LIST</button>
  </form>
    <form  action="/register" method="get">
    <button type="submit" class="button">Регистрация</button>
  </form>
</div>
</c:if>
<div align="center">

  <c:if test = "${pageContext.request.remoteUser != null}">
    <h3>Добро пожаловать!  <c:out value="${pageContext.request.remoteUser}"></c:out></h3><br/>
    <form  action="/app" method="get">
      <button type="submit" class="button">EVENT LIST</button>
    </form>
    <sf:form action="/account" method="post">
      <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
      <button type= "submit" class="button">Мой аккаунт</button>
    </sf:form>
  </c:if>

</div>

<div align="center">
<sf:form action="/login" method="post">

  <input name="username" type="text" placeholder = "LOGIN" autofocus="true"/><br/><br/>
  <input name="password" type="password" placeholder="PASSWORD"/><br/><br/>


  <span class="error">${error}</span><br/>
  <c:if test = "${pageContext.request.remoteUser == null}">
    <input id="remember_me" name="remember-me" type="checkbox"/>
    <label for = "remember_me">Запомнить меня</label><br/><br/>
    <button type="submit" class="button"> Вход </button></c:if>
</sf:form>
</div>

</body>
</html>
