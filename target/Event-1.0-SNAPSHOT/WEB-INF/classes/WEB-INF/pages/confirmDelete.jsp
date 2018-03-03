<%@ include file="/WEB-INF/pages/jspf/taglib.jspf" %>
<html>
<head>
  <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
  <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">

  <title>==EVENT_MAP==</title>
</head>
<body>

<div align="center">

  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <h2><st:message code="message.confirmDelete"/></h2>
  <br/>
  <br/>

  <div align="center">

    <sf:form  action="/app" method="get">
      <button type="submit" class="button"><st:message code="button.cancel"/></button>
    </sf:form>
  </div>
  <br/>
  <br/>
  <sf:form  action="/deleteTrue" method="post">
    <input type = "hidden" name = "id" value="${id}">
    <button type="submit" class="button"><st:message code="button.continue"/></button>
  </sf:form>

</div>


</body>
</html>
