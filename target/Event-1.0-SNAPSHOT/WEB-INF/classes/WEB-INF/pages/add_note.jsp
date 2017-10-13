<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 3/10/2017
  Time: 23:08
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
    <form  action="/app" method="get">
      <button type="submit" class="button">EVENT LIST</button>
    </form>
    <c:if test = "${pageContext.request.remoteUser != null}" >
      <sf:form action="/account" method="post">
        <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button">My account</button>
      </sf:form>
    </c:if>
  </div>
  <sf:form enctype="multipart/form-data" modelAttribute="noteUploader" action="/addNote" method="post">
  <div><h3> Fill the form: </h3></div>

    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
    <div> Coordinates: <br/>Latitude ..... <input type="text" name="latitude" placeholder="от -90 до 90"><br/>
                            Longitude .. <input type="text" name="longitude" placeholder="от -180 до 180"></div>
    <br/>
    For latitude, use values ranging from -90 to 90.<br/>
    Longitude should be between -180 and 180.<br/><br/>
    <div> Address or description of the place: <br/> <textarea cols="100" rows="3" name="placeDescription"></textarea></div>
    <br/>
    <div> Date: <br/> <input type="date" name="date"></div>
    <br/>
    <div> Event: <br/> <textarea cols="100" rows="10" name="action"></textarea></div>
    <br/>

    <div>Photo 1:  <input type="file" name="files[0]" /></div>
    <div>Photo 2:  <input type="file" name="files[1]" /></div>
    <div>Photo 3:  <input type="file" name="files[2]" /></div>
    <div>Photo 4:  <input type="file" name="files[3]" /></div>
    <div>Photo 5:  <input type="file" name="files[4]" /></div>


  <div><button type="submit" class="button">Publish</button></div>
  </sf:form>

</body>
</html>





