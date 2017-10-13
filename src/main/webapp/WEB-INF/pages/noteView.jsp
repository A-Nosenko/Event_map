<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 3/24/2017
  Time: 09:19
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
<sf:form  action="/app" method="get">
  <button type="submit" class="button">EVENT LIST</button>
</sf:form>
<c:if test = "${pageContext.request.remoteUser != null}" >
  <sf:form action="/account" method="post">
    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
    <button type= "submit" class="button">My account</button>
  </sf:form>
  </div>
</c:if>
<sf:form action="comments" method="get">
  <input type = "hidden" name = "noteId" value="${note.id}">
  <button type="submit" class="button"> View | Comments</button>
</sf:form>

<sf:form enctype="multipart/form-data" modelAttribute="noteUploader" action="/noteViewAndAlter" method="post">

  <div> Coordinates: <br/> Latitude ..... <input type="text" name="latitude" value="${note.latitude}"><br/>
                           Longitude .. <input type="text" name="longitude" value="${note.longitude}"><span class="error">${error}</span></div>
  <br/>
  For latitude, use values ranging from -90 to 90.<br/>
  Longitude should be between -180 and 180.<br/><br/>
  <div> Address or description of the place: <br/> <textarea cols="100" rows="3" name="placeDescription">${note.placeDescription}</textarea></div>
  <br/>
  <div> Date: <br/> <input type="date" name="date" value="${note.date}"></div>
  <br/>
  <div> Event: <br/> <textarea cols="100" rows="10" name="action">${note.action}</textarea></div>
  <br/>
  <h3> Upload more photos: </h3>
  <div>Photo 1:  <input type="file" name="files[0]" /></div>
  <div>Photo 2:  <input type="file" name="files[1]" /></div>
  <div>Photo 3:  <input type="file" name="files[2]" /></div>
  <div>Photo 4:  <input type="file" name="files[3]" /></div>
  <div>Photo 5:  <input type="file" name="files[4]" /></div>

<input type="hidden" name="id" value="${note.id}">
  <div align="center"><button value="submit" class="button"> Save </button></div>
</sf:form>

<c:forEach items="${photos}" var="photo">
  <sf:form action="/deletePhoto" method="post">
  <a href = "/image/${photo.id}" title = "рисунок" target = "_blank" > <img  alt = "image" height = "100"  src="/image/${photo.id}" /></a><input type = "hidden" name = "id" value="${photo.id}">
      <button type="submit" class="button">Delete photo</button>
    </sf:form>
  </c:forEach>


</body>
</html>
