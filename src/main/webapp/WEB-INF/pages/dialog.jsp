<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 4/3/2017
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/pages/jspf/taglib.jspf" %>
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

<div align="right">
  <sf:form action="/account" method="post">
    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
    <button type= "submit" class="button"><st:message code="button.area"/></button>
  </sf:form>

  <sf:form  action="/app" method="get">
    <button type="submit" class="button"><st:message code="button.eventList"/></button>
  </sf:form>
</div>

<sf:form action="/dialog" method="post">
  <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
  <input type="hidden" name="userNameTo" value="${userNameTo}"/>
  <button type="submit" class="button"><st:message code="button.refresh"/></button>
</sf:form>

<h2>Your login: ${pageContext.request.remoteUser}</h2>

<sf:form modelAttribute="message" method="post" action="/addMessage">
  <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}">
  <input type="hidden" name="userNameTo" value="${userNameTo}">
  <st:message code="message.newMessage"/>: <br/> <textarea cols="100" rows="5" name="messageText"></textarea>
  <div align="center"><button type="submit" class="button"><st:message code="button.send"/></button></div>
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
        <button type="submit" class="button"><st:message code="button.delete"/></button>
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
            <button type="submit" class="button"><st:message code="button.delete"/></button>
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
