<%@ include file="/WEB-INF/pages/jspf/taglib.jspf" %>
<html>
<head>
    <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">

    <title>==EVENT_MAP==</title>
</head>
<body>

<div align="left">
    <a href="/"><img src="resources/images/ref.gif"></a>
</div>
<div align="center">

    <h1><st:message code="message.youAreWelcome"/>  <security:authentication property="principal.username"/> !!!</h1>

    <form  action="/app" method="get">
        <button type="submit" class="button"><st:message code="button.eventList"/></button>
    </form>

    <sf:form action="/account" method="post">
        <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button"><st:message code="button.area"/></button>
    </sf:form>
    </div>

</body>
</html>
