<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/2/2017
  Time: 09:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri ="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>==EVENT_MAP==</title>
    <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<div align="left">
    <a href="/"><img src="resources/images/ref.gif"></a>
</div>
<div align="center">

    <h1>Добро пожаловать, <security:authentication property="principal.username"/> !!!</h1>

<form  action="/app" method="get">
    <button type="submit" class="button">_EVENT MAP</button>
</form>
            <sf:form action="/account" method="post">
                <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
            <button type= "submit" class="button">_Мой аккаунт</button>
        </sf:form>
    </div>

</body>
</html>
