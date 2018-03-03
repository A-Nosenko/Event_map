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
<sf:form  action="/app" method="get">
  <button type="submit" class="button"><st:message code="button.eventList"/></button>
</sf:form>
<c:if test = "${pageContext.request.remoteUser != null}" >
  <sf:form action="/account" method="post">
    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
    <button type= "submit" class="button"><st:message code="button.area"/></button>
  </sf:form>
  </div>
</c:if>
<sf:form action="comments" method="get">
  <input type = "hidden" name = "noteId" value="${note.id}">
  <button type="submit" class="button"><st:message code="button.viewComments"/></button>
</sf:form>

<sf:form enctype="multipart/form-data" modelAttribute="noteUploader" action="/noteViewAndAlter" method="post">

  <div> <st:message code="message.coordinates"/> <br/>
    <st:message code="message.latitude"/> ..... <input type="text" name="latitude" value="${note.latitude}"><br/>
    <st:message code="message.longitude"/>.. <input type="text" name="longitude" value="${note.longitude}"><span class="error">${error}</span></div>
  <br/>
  <st:message code="message.latitude.message"/><br/>
  <st:message code="message.longitude.message"/><br/><br/>
  <div><st:message code="message.address"/><br/> <textarea cols="100" rows="3" name="placeDescription">${note.placeDescription}</textarea></div>
  <br/>
  <div><st:message code="message.date"/>: <br/> <input type="date" name="date" value="${note.date}"></div>
  <br/>
  <div><st:message code="message.event"/>: <br/> <textarea cols="100" rows="10" name="action">${note.action}</textarea></div>
  <br/>
  <h3> <st:message code="message.addPhotos"/> </h3>
  <div><st:message code="message.photo"/>1:  <input type="file" name="files[0]" /></div>
  <div><st:message code="message.photo"/>2:  <input type="file" name="files[1]" /></div>
  <div><st:message code="message.photo"/>3:  <input type="file" name="files[2]" /></div>
  <div><st:message code="message.photo"/>4:  <input type="file" name="files[3]" /></div>
  <div><st:message code="message.photo"/>5:  <input type="file" name="files[4]" /></div>

<input type="hidden" name="id" value="${note.id}">
  <div align="center"><button value="submit" class="button"><st:message code="button.saveNote"/></button></div>
</sf:form>

<c:forEach items="${photos}" var="photo">
  <sf:form action="/deletePhoto" method="post">
  <a href = "/image/${photo.id}" title = "рисунок" target = "_blank" > <img  alt = "image" height = "100"  src="/image/${photo.id}" /></a><input type = "hidden" name = "id" value="${photo.id}">
      <button type="submit" class="button"><st:message code="button.deletePhoto"/></button>
    </sf:form>
  </c:forEach>


</body>
</html>
