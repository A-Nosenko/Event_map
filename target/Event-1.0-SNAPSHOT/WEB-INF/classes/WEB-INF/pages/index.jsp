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
    <META NAME="keywords" CONTENT="
    archeology, archaeologist, finding, find, search, dig, artefact,
    археология, археолог, поиск, раскопки, артефакт,
    археологія, археолог, пошук, розкопки, артефакт">
    <META NAME="description" CONTENT="Marks of archaeological finds on the map">
    <META NAME="Document-state" CONTENT="Dynamic">
    <META NAME="AUTHOR" CONTENT="A-Nosenko">
    <title>==EVENT_MAP==</title>
    <link href="<c:url value=" resources
    /css/s.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value=" resources
    /images/head.ico" />" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<style>
    body {
        background-image: url(resources/images/theme.jpg);
        background-position: center center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
    }
</style>
<div id="leftHeader">
    <!--a href="/app"><img src="resources/images/index.gif" alt="Welcome!" width="100%" height="auto"></a-->
    <br/>
    <sf:form action="/register" method="get">
        <button type="submit" class="button"><st:message code="button.registration"/></button>
    </sf:form>

    <br/>
    <c:if test="${pageContext.request.remoteUser != null}">
        <st:message code="message.yourLogin"/> <c:out value="${pageContext.request.remoteUser}       "/>
        <sf:form action="/logout" method="post">
            <button type="submit" class="button"><st:message code="button.exit"/></button>
        </sf:form>
        <sf:form action="/account" method="post">
            <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
            <button type="submit" class="button"><st:message code="button.area"/></button>
        </sf:form>
    </c:if>

    <c:if test="${pageContext.request.remoteUser == null}">
        <sf:form action="/login" method="get">
            <button type="submit" class="button"><st:message code="button.login"/></button>
        </sf:form>
    </c:if>

    <sf:form action="/app" method="get">
        <button type="submit" class="button"><st:message code="button.eventList"/></button>
    </sf:form>

    <security:authorize access="hasRole('ROLE_ADMIN')">
        <sf:form action="/admin" method="post">
            <button type="submit" class="button"><st:message code="button.adminPage"/></button>
        </sf:form>
    </security:authorize>

    <sf:form action="/map" method="post">
        <button type="submit" class="button"><st:message code="button.eventMap"/></button>
    </sf:form>
    <br/>

    <h2>
        <li><st:message code="index.li.1"/></li>
        <c:if test="${pageContext.request.remoteUser == null}">
            <h2>
                <li><st:message code="app.li.1"/></li>
                <li><st:message code="app.li.2"/></li>
                <li><st:message code="app.li.3"/></li>
            </h2>
        </c:if>

        <c:if test="${pageContext.request.remoteUser != null}">
            <h2>
                <li><st:message code="app.li.1"/></li>
                <li><st:message code="app.li.3"/></li>
            </h2>

            <sf:form action="/dialog" method="post">
                <li><st:message code="message.toAdmin"/></li>
                <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                <input type="hidden" name="userNameTo" value="Admin"/>
                <button type="submit" class="button"><st:message code="button.toAdmin"/></button>
            </sf:form>

        </c:if>
    </h2>
    <br/>
    <br/><br/><br/>
    <br/>

</div>

<div id="rightHeader">
    <%@ include file="/WEB-INF/pages/jspf/select.jspf" %>
    <br/>

</div>

<br/>
<br/>
<br/><br/><br/>
<br/>
</body>
</html>
