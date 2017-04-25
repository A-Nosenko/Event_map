<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 4/2/2017
  Time: 08:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri ="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>==EVENT_MAP==</title>
    <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
</head>
<body>

<div align="right">
    <sf:form action="${contextPath}/logout" method="post">
        <button type= "submit" class="button">===Выйти===</button>
    </sf:form>
</div>
<div align="left">
    <a href="/"><img src="resources/images/ref.gif"></a>
</div>

<div align="right">


    <sf:form  action="/app" method="get">
        <button type="submit" class="button">_EVENT MAP</button>
    </sf:form>



</div>

<h2>Ваш логин: ${pageContext.request.remoteUser}</h2>
<br/>
<table width="100%">
    <tr><td width="20%">
<img  alt = "avatar" width="90%" src="/userImage/${pageContext.request.remoteUser}" />
<br/>
<br/>
        <div align="left">
            <sf:form enctype="multipart/form-data" modelAttribute="accountUploader" method="post" action="/setAccount">
                <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
                 <br/> <input type="file" name="file" />
                <button type="submit" class="button">Загрузить</button>
        </sf:form>
        </div>
    </td>
        <td width="80%">
            <div align="left">
            <h2>Сообщения:</h2>

                <sf:form action="/account" method="post">
                    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
                    <button type= "submit" class="button">= Обновить =</button>
                </sf:form>

            <c:forEach items="${messages}" var="message">
<table width="90%">
    <tr>
        <td width="35%"><div>
            <c:if test="${message.userNameTo == pageContext.request.remoteUser}">
            Получено от  ${message.userNameFrom}<br/></c:if>
            <c:if test="${message.userNameFrom == pageContext.request.remoteUser}">
            Отправлено пользователю  ${message.userNameTo}<br/></c:if>
            <fmt:formatDate value="${message.messageTime}" pattern="dd-MM-yyyy HH:mm:ss" />
        </div></td>
        <td width="15%">
                 <sf:form action="/dialog" method="post">
                <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                <c:if test="${message.userNameTo == pageContext.request.remoteUser}">
                    <input type="hidden" name="userNameTo" value="${message.userNameFrom}"/></c:if>
                <c:if test="${message.userNameFrom == pageContext.request.remoteUser}">
                    <input type="hidden" name="userNameTo" value="${message.userNameTo}"/></c:if>
                <button type="submit" class="button">К диалогу</button>
            </sf:form>
        </td>
        <td width="50%"><div>
            ${message.messageText}
        </div></td>

    </tr>
</table>
        </c:forEach></div>
        </td>
         </tr>
</table>
</body>
</html>
