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
  <div align="right">
    <form  action="/app" method="get">
      <button type="submit" class="button"><st:message code="button.eventList"/></button>
    </form>
    <c:if test = "${pageContext.request.remoteUser != null}" >
      <sf:form action="/account" method="post">
        <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button"><st:message code="button.area"/></button>
      </sf:form>
    </c:if>
  </div>
  <sf:form enctype="multipart/form-data" modelAttribute="noteUploader" action="/addNote" method="post">
  <div><h3><st:message code="message.fillTheForm"/></h3></div>

    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
    <div><st:message code="message.coordinates"/>
      <br/><st:message code="message.latitude"/> ..... <input type="text" name="latitude" ><br/>
      <br/><st:message code="message.longitude"/> .. <input type="text" name="longitude" ></div>
    <br/>
    <st:message code="message.latitude.message"/><br/>
    <st:message code="message.longitude.message"/><br/><br/>
    <div><st:message code="message.address"/><br/> <textarea cols="100" rows="3" name="placeDescription"></textarea></div>
    <br/>
    <div><st:message code="message.date"/>: <br/> <input type="date" name="date"></div>
    <br/>
    <div><st:message code="message.event"/>: <br/> <textarea cols="100" rows="10" name="action"></textarea></div>
    <br/>

    <div><st:message code="message.photo"/> 1:  <input type="file" name="files[0]" /></div>
    <div><st:message code="message.photo"/> 2:  <input type="file" name="files[1]" /></div>
    <div><st:message code="message.photo"/> 3:  <input type="file" name="files[2]" /></div>
    <div><st:message code="message.photo"/> 4:  <input type="file" name="files[3]" /></div>
    <div><st:message code="message.photo"/> 5:  <input type="file" name="files[4]" /></div>


  <div><button type="submit" class="button"><st:message code="button.upload"/></button></div>
  </sf:form>

</body>
</html>





