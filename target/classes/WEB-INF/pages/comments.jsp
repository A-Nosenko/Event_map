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
    <button type="submit" class="button">EVENT LIST</button>
  </sf:form>
  <br/>
      <c:if test = "${pageContext.request.remoteUser != null}" >
        <sf:form action="/account" method="post">
          <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button">My account</button>
        </sf:form>
      </c:if>



</div>
<table width = "100%">
  <thead><tr>
    <td width="10%">    </td>
    <td width="5%">   </td>
    <td width="10%"> <st:message code="message.date"/> </td>
    <td width="10%"> <st:message code="message.address"/> </td>
    <td width="20%"> <st:message code="message.event"/> </td>
    <td width="30%"> <st:message code="message.photo"/> </td>
    <td width="15%">     </td>
  </tr></thead>
      <tr>
        <td>
          <div>
            <img  alt = "image" width="100%"  src="/userImage/${note.userName}" />
            ${note.userName}<br/>
            <c:if test = "${pageContext.request.remoteUser != note.userName}" >
              <sf:form action="/dialog" method="post">
                <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                <input type="hidden" name="userNameTo" value="${note.userName}"/>
                <button type="submit" class="button"><st:message code="button.message"/></button>
              </sf:form>
            </c:if>
            <fmt:formatDate value="${note.note_time}" pattern="dd-MM-yyyy HH:mm:ss" /></div>
        </td>
        <td> <c:if test="${not empty note.latitude and not empty note.longitude}">
          <a href = "https://www.google.com.ua/maps/place/@${note.latitude},${note.longitude},291m/data=!3m2!1e3!4b1!4m5!3m4!1s0x0:0x0!8m2!3d${note.latitude}!4d${note.longitude}" target = "_blank">
            <img alt = "== Map ==" align="middle" src = "resources/images/map.gif">
          </a></c:if> </td><td> ${note.date} </td><td> ${note.placeDescription} </td><td> ${note.action} </td>
      <td>
        <c:forEach items="${photos}" var="photo">
           <a href = "/image/${photo.id}" title = "image" target = "_blank" > <img  alt = "image" height = "100"  src="/image/${photo.id}" /></a>
           </c:forEach>
      </td>
      <td>
        <c:if test="${pageContext.request.remoteUser == note.userName}">
          <sf:form  action="/delete" method="post">
            <input type = "hidden" name = "id" value="${note.id}">
            <button type="submit" class="button"><st:message code="button.delete"/></button>
          </sf:form>
        </c:if>

        <security:authorize access = "hasRole('ROLE_ADMIN')">
          <sf:form  action="/delete" method="post">
            <input type = "hidden" name = "id" value="${note.id}">
            <button type="submit" class="button"><st:message code="button.delete"/></button>
          </sf:form>
        </security:authorize>

        <c:if test="${pageContext.request.remoteUser == note.userName}">
          <sf:form action="noteViewAndAlter" method="get">
            <input type = "hidden" name = "id" value="${note.id}">
            <button type="submit" class="button"><st:message code="button.alter"/></button>
          </sf:form>
        </c:if>

      </td></tr>
  </table>


<h1><st:message code="message.comments"/>:</h1>

<table align = "left" width = "100%">
  <thead>
    <tr>
      <td width="10%">   </td>
      <td width="5%">   </td>
      <td width="75%">   </td>
      <td width="10%">    </td></tr>
  </thead>
<c:forEach items="${commentList}" var="comment">

  <tr>
    <td>
      <div>
        <img  alt = "image" width="100%"  src="/userImage/${comment.userName}" />
          ${comment.userName}<br/>
        <c:if test = "${pageContext.request.remoteUser != comment.userName}" >
          <sf:form action="/dialog" method="post">
            <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
            <input type="hidden" name="userNameTo" value="${comment.userName}"/>
            <button type="submit" class="button"><st:message code="button.message"/></button>
          </sf:form>
        </c:if>
        <fmt:formatDate value="${comment.time}" pattern="dd-MM-yyyy HH:mm:ss" />
        </div></td>
    <td>   </td>
        <td>
        ${comment.comment}<br/>
      <c:forEach items="${commentPhotos}" var="commentPhoto">
        <c:if test="${comment.id == commentPhoto.commentId}">
          <a href = "/commentImage/${commentPhoto.id}" title = "image" target = "_blank" > <img  alt = "commentImage" height = "100"  src="/commentImage/${commentPhoto.id}" /></a>
        </c:if>
      </c:forEach>
             </td>
    <td>

      <c:if test="${pageContext.request.remoteUser == note.userName}">
        <sf:form  action="/deleteComment" method="post">
          <input type = "hidden" name = "commentId" value="${comment.id}">
          <input type = "hidden" name = "noteId" value="${note.id}">
          <button type="submit" class="button"><st:message code="button.delete"/></button>
        </sf:form>
      </c:if>

      <security:authorize access = "hasRole('ROLE_ADMIN')">
        <sf:form  action="/deleteComment" method="post">
          <input type = "hidden" name = "commentId" value="${comment.id}">
          <input type = "hidden" name = "noteId" value="${note.id}">
          <button type="submit" class="button"><st:message code="button.delete"/></button>
        </sf:form>
      </security:authorize>


    </td></tr>
    </c:forEach>
</table>
<br/>

<h2><st:message code="message.add.comment"/></h2><br/>

<sf:form enctype="multipart/form-data" modelAttribute="commentUploader" action="/addComment" method="post">

  <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
  <input type="hidden" name="noteId" value="${note.id}"/>
  <textarea cols="100" rows="3" name="comment"></textarea>
  <br/>
  <h2><st:message code="message.addPhotos"/></h2><br/>
  <div>Photo 1:  <input type="file" name="files[0]" /></div>
  <div>Photo 2:  <input type="file" name="files[1]" /></div>
  <div>Photo 3:  <input type="file" name="files[2]" /></div>
  <div>Photo 4:  <input type="file" name="files[3]" /></div>
  <div>Photo 5:  <input type="file" name="files[4]" /></div>
  <button type="submit" class="button"><st:message code="button.save"/></button>
  </sf:form>

</body>
</html>
