

<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/1/2017
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/pages/jspf/taglib.jspf" %>
<html>
<head>
    <META NAME="description" CONTENT="This site contains information for bicyclists">
    <META NAME="keywords" CONTENT="Information, bicyclist, event, road accident, bicycle, search, bike">
    <META NAME="Document-state" CONTENT="Dynamic">
    <META NAME="AUTHOR" CONTENT="A-Nosenko">
    <title>==EVENT_MAP==</title>
    <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<%@ include file="/WEB-INF/pages/jspf/select.jspf" %>
<div align="center">
    <a href="/app"><img src="resources/images/index.gif" alt="Welcome!"></a>
</div>

<div align="right">

<sf:form  action="/register" method="get">
    <button type="submit" class="button"><st:message code="registration"/></button>
</sf:form>

    <br/>
    <c:if test = "${pageContext.request.remoteUser != null}" >
       Your login:  <c:out value="${pageContext.request.remoteUser}       "/>
    <sf:form action="/logout" method="post">
        <button type= "submit" class="button"> Exit </button>
    </sf:form>
        <sf:form action="/account" method="post">
            <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button">My account</button>
        </sf:form>
    </c:if>

    <c:if test = "${pageContext.request.remoteUser == null}" >
            <sf:form action="/login" method="get">
            <button type= "submit" class="button"> Login </button>
        </sf:form>
    </c:if>

    <sf:form  action="/app" method="get">
        <button type="submit" class="button">EVENT LIST</button>
    </sf:form>

    <security:authorize access = "hasRole('ROLE_ADMIN')">
        <sf:form  action="/admin" method="post">
            <button type="submit" class="button">ADMIN_PAGE</button>
        </sf:form>
    </security:authorize>

    <sf:form action="/map" method="post">
         <button type= "submit" class="button">EVENT MAP</button>
    </sf:form>

    <br/>
    <br/>
    <br/><br/><br/>
    <br/>
    <div align="center">
        <a href="https://github.com/A-Nosenko/Event_map" >SOURCE CODE</a>
    </div>
</div>

</body>
</html>
