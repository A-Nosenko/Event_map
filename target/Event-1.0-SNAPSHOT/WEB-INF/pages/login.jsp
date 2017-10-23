
<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/15/2017
  Time: 17:51
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

<div align = "right">

<c:if test = "${pageContext.request.remoteUser == null}">
  <form  action="/app" method="get">
    <button type="submit" class="button"><st:message code="button.eventList"/></button>
  </form>
    <form  action="/register" method="get">
    <button type="submit" class="button"><st:message code="button.registration"/></button>
  </form>
</div>
</c:if>
<div align="center">

  <c:if test = "${pageContext.request.remoteUser != null}">
    <h3> <st:message code="message.youAreWelcome"/>  <c:out value="${pageContext.request.remoteUser}"></c:out></h3><br/>
    <form  action="/app" method="get">
      <button type="submit" class="button"><st:message code="button.eventList"/></button>
    </form>
    <sf:form action="/account" method="post">
      <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
      <button type= "submit" class="button"><st:message code="button.area"/></button>
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
    <label for = "remember_me"><st:message code="holder.rememberMe"/></label><br/><br/>
    <button type="submit" class="button"><st:message code="button.signIn"/></button></c:if>
</sf:form>
</div>

</body>
</html>
