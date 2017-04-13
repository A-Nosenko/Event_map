<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 3/25/2017
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri ="http://www.springframework.org/security/tags"%>
<html>
<head>
  <title>==EVENT_MAP==</title>
  <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
  <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
  <style type="text/css">
    span.error {
      color: orangered;
    }
  </style>
</head>
<body>
<div align="left">
  <a href="/"><img src="resources/images/ref.gif"></a>
</div>
<div align="right">

  <sf:form  action="/app" method="get">
    <button type="submit" class="button">_EVENT MAP</button>
  </sf:form>
  <br/>
      <c:if test = "${pageContext.request.remoteUser != null}" >
        <sf:form action="/account" method="post">
          <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button">_Мой аккаунт</button>
        </sf:form>
      </c:if>



</div>
<table width = "100%">
  <thead><tr>
    <td width="10%">  </td>
    <td width="5%">   </td>
    <td width="10%"> Дата </td>
    <td width="10%"> Адрес </td>
    <td width="25%"> Событие </td>
    <td width="30%"> Фото </td>
    <td width="10%">     </td>
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
                <button type="submit" class="button">Сообщение</button>
              </sf:form>
            </c:if>
            ${note.note_time}</div>
        </td>
        <td> <c:if test="${not empty note.latitude and not empty note.longitude}">
          <a href = "https://www.google.com.ua/maps/@${note.latitude},${note.longitude},18z" target = "_blank">
            <img alt = "== Map ==" align="middle" src = "resources/images/map.bmp">
          </a></c:if> </td><td> ${note.date} </td><td> ${note.placeDescription} </td><td> ${note.action} </td>
      <td>
        <c:forEach items="${photos}" var="photo">
           <a href = "/image/${photo.id}" title = "рисунок" target = "_blank" > <img  alt = "image" height = "100"  src="/image/${photo.id}" /></a>
           </c:forEach>
      </td>
      <td>
        <c:if test="${pageContext.request.remoteUser == note.userName}">
          <sf:form  action="/delete" method="post">
            <input type = "hidden" name = "id" value="${note.id}">
            <button type="submit" class="button">Удалить</button>
          </sf:form>
        </c:if>

        <security:authorize access = "hasRole('ROLE_ADMIN')">
          <sf:form  action="/delete" method="post">
            <input type = "hidden" name = "id" value="${note.id}">
            <button type="submit" class="button">Удалить</button>
          </sf:form>
        </security:authorize>

        <c:if test="${pageContext.request.remoteUser == note.userName}">
          <sf:form action="noteViewAndAlter" method="get">
            <input type = "hidden" name = "id" value="${note.id}">
            <button type="submit" class="button">Править</button>
          </sf:form>
        </c:if>

      </td></tr>
  </table>


<h1>Комментарии:</h1>

<table align = "left" width = "95%">
  <thead>
    <tr>
      <td width="10%">   </td>
      <td width="5%">   </td>
      <td width="75%">   </td>
      <td width="5%">    </td></tr>
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
            <button type="submit" class="button">Сообщение</button>
          </sf:form>
        </c:if>
           ${comment.time}
        </div></td>
    <td>   </td>
        <td>
        ${comment.comment}<br/>
      <c:forEach items="${commentPhotos}" var="commentPhoto">
        <c:if test="${comment.id == commentPhoto.commentId}">
          <a href = "/commentImage/${commentPhoto.id}" title = "рисунок" target = "_blank" > <img  alt = "commentImage" height = "100"  src="/commentImage/${commentPhoto.id}" /></a>
        </c:if>
      </c:forEach>
             </td>
    <td>

      <c:if test="${pageContext.request.remoteUser == note.userName}">
        <sf:form  action="/deleteComment" method="post">
          <input type = "hidden" name = "commentId" value="${comment.id}">
          <input type = "hidden" name = "noteId" value="${note.id}">
          <button type="submit" class="button">Удалить</button>
        </sf:form>
      </c:if>

      <security:authorize access = "hasRole('ROLE_ADMIN')">
        <sf:form  action="/deleteComment" method="post">
          <input type = "hidden" name = "commentId" value="${comment.id}">
          <input type = "hidden" name = "noteId" value="${note.id}">
          <button type="submit" class="button">Удалить</button>
        </sf:form>
      </security:authorize>


    </td></tr>
    </c:forEach>
</table>

<h2>Добавить комментарий:</h2><br/>

<sf:form enctype="multipart/form-data" modelAttribute="commentUploader" action="/addComment" method="post">

  <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
  <input type="hidden" name="noteId" value="${note.id}"/>
  <textarea cols="100" rows="3" name="comment"></textarea>
  <br/>
  <h2>Прикрепить фотографии:</h2><br/>
  <div>Фото 1:  <input type="file" name="files[0]" /></div>
  <div>Фото 2:  <input type="file" name="files[1]" /></div>
  <div>Фото 3:  <input type="file" name="files[2]" /></div>
  <div>Фото 4:  <input type="file" name="files[3]" /></div>
  <div>Фото 5:  <input type="file" name="files[4]" /></div>
  <button type="submit" class="button">Добавить</button>
  </sf:form>

</body>
</html>
