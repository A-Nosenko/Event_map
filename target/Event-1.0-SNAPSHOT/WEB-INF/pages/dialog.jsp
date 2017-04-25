<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 4/3/2017
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri ="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<div align="right">
  <sf:form action="/account" method="post">
    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
    <button type= "submit" class="button">_Мой аккаунт</button>
  </sf:form>

  <sf:form  action="/app" method="get">
    <button type="submit" class="button">_EVENT MAP</button>
  </sf:form>
</div>

<sf:form action="/dialog" method="post">
  <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
  <input type="hidden" name="userNameTo" value="${userNameTo}"/>
  <button type="submit" class="button">= Обновить =</button>
</sf:form>

<h2>Ваш логин: ${pageContext.request.remoteUser}</h2>

<sf:form modelAttribute="message" method="post" action="/addMessage">
  <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}">
  <input type="hidden" name="userNameTo" value="${userNameTo}">
  Сообщение: <br/> <textarea cols="100" rows="5" name="messageText"></textarea>
  <div align="center"><button type="submit" class="button">Отправить</button></div>
</sf:form>

<c:forEach items="${messages}" var="message">
<div align="left">
<c:if test="${message.userNameTo == pageContext.request.remoteUser}">
  <table width="50%"><tr>
  <td width="20%"><div>
    <img  alt = "image" width="100%"  src="/userImage/${message.userNameFrom}" />
    ${message.userNameFrom}<br/>
    <fmt:formatDate value="${message.messageTime}" pattern="dd-MM-yyyy HH:mm:ss" />
  </div></td>
    <td width="20%">
      <sf:form  action="/deleteMessage" method="post">
        <input type = "hidden" name = "id" value="${message.id}">
        <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}">
        <input type="hidden" name="userNameTo" value="${userNameTo}">
        <button type="submit" class="button">Удалить</button>
      </sf:form>
    </td>
    <td width="60%"><div>
     ${message.messageText}
    </div></td>

        </tr></table>
        </c:if>
</div>
  <div align="right">
    <c:if test="${message.userNameFrom == pageContext.request.remoteUser}">
      <table width="50%"><tr>
         <td width="60%"><div>
            ${message.messageText}
        </div></td>
        <td width="20%">
          <sf:form  action="/deleteMessage" method="post">
            <input type = "hidden" name = "id" value="${message.id}">
            <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}">
            <input type="hidden" name="userNameTo" value="${userNameTo}">
            <button type="submit" class="button">Удалить</button>
          </sf:form>
        </td>
         <td width="20%"><div>
          <img  alt = "image" width="100%"  src="/userImage/${message.userNameFrom}" />
            ${message.userNameFrom}<br/>
           <fmt:formatDate value="${message.messageTime}" pattern="dd-MM-yyyy HH:mm:ss" />
        </div></td>
            </tr></table>
            </c:if>
  </div>
</c:forEach>


</body>
</html>
