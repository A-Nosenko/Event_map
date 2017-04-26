<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/16/2017
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri ="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<table>
    <tr><td width="70%">
        <c:if test = "${pageContext.request.remoteUser == null}" >
        <h2>
                    <li>Информационный сервис велосипедистов Харькова.</li>
                    <li>Вы можете просматривать описание событий, выполнять поиск по ключевым словам,
            логину автора или дате события.</li>
                    <li>Для публикации своих записей и комментариев Вам необходимо зарегистрироваться на сайте.</li>
                    <li>Администрация сайта не несет ответственности за размещенную пользователями информацию.</li>
        </h2>
        </c:if>

        <c:if test = "${pageContext.request.remoteUser != null}" >
            <h2>
                <li>Информационный сервис велосипедистов Харькова.</li>
                <li>Вы можете просматривать описание событий, выполнять поиск по ключевым словам,
                    логину автора или дате события.</li>
                <li>Администрация сайта не несет ответственности за размещенную пользователями информацию.</li>

            </h2>

             <sf:form action="/dialog" method="post">
        <li>Если у Вас есть вопросы, пожелания, напишите</li>
                    <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                    <input type="hidden" name="userNameTo" value="Admin"/>
                    <button type="submit" class="button">Администратору</button>
                </sf:form>

        </c:if>

        </td><td width="30">
<div align="right">
  <c:if test = "${pageContext.request.remoteUser != null}" >
  Welcome! <c:out value="${pageContext.request.remoteUser}"/>
  <sf:form action="${contextPath}/logout" method="post">
  <button type= "submit" class="button">===Выйти===</button>
  </sf:form>
      <sf:form action="/account" method="post">
          <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
          <button type= "submit" class="button">_Мой аккаунт</button>
      </sf:form>
  </c:if>

  <c:if test = "${pageContext.request.remoteUser == null}" >
    <sf:form  action="/register" method="get">
      <button type="submit" class="button">Регистрация</button>
    </sf:form>
      <sf:form class="form-inline" action="/login" method="get">
      <button type= "submit" class="button">=== Вход ===</button>
    </sf:form>
  </c:if>

  <form  action="/app" method="get">
   По порядку даты события  <button type="submit" class="button">Показать все</button>
  </form>

  <form  action="/appSortByNoteTime" method="get">
   По порядку публикации <button type="submit" class="button">Показать все</button>
  </form>


  <form  action="/addNote" method="get">
    <button type="submit" class="button">= Добавить =</button>
  </form>

    <sf:form action="/map" method="post">
        <button type= "submit" class="button">===Карта ===</button>
    </sf:form>
 </div>
        </td></tr></table>

  <div align="left">
  <sf:form  action="/appSearchByDate" method="post">
    <div>
      <button type="submit" class="button">=== Найти ==</button>
      <input type="date" name="pattern" >
      </div>
  </sf:form>
  <sf:form  action="/appSearch" method="post">
    <div>
      <button type="submit" class="button">=== Найти ==</button>
      <input type="text" name="pattern" placeholder="Ключевые слова события">
      </div>
  </sf:form>
  <sf:form  action="/appSearchByLogin" method="post">
    <div>
      <button type="submit" class="button">=== Найти ==</button>
      <input type="text" name="pattern" placeholder="Логин пользователя">
      </div>
  </sf:form>
  <sf:form  action="/appSearchByAddress" method="post">
    <div>
      <button type="submit" class="button">=== Найти ==</button>
      <input type="text" name="pattern" placeholder="Поиск по адресу">
      </div>
  </sf:form>



  </div>


  <table width = "100%">
  <thead><tr>
    <td width="10%">    </td>
    <td width="5%">   </td>
    <td width="10%"> Дата </td>
    <td width="10%"> Адрес </td>
    <td width="25%"> Событие </td>
    <td width="30%"> Фото </td>
    <td width="10%">     </td>
  </tr></thead>
  <c:forEach items="${notes}" var="note">
        <tr>
          <td> <div>
              <img  alt = "image" width="100%"  src="/userImage/${note.userName}" />
              ${note.userName}<br/>
              <c:if test = "${pageContext.request.remoteUser != note.userName}" >
              <sf:form action="/dialog" method="post">
                  <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                  <input type="hidden" name="userNameTo" value="${note.userName}"/>
                  <button type="submit" class="button">Сообщение</button>
              </sf:form>
              </c:if>

             <fmt:formatDate value="${note.note_time}" pattern="dd-MM-yyyy HH:mm:ss" /> </div>

          </td>
          <td> <div style="height:207px; overflow:auto"><c:if test="${not empty note.latitude and not empty note.longitude}">
            <a href = "https://www.google.com.ua/maps/place/@${note.latitude},${note.longitude},291m/data=!3m2!1e3!4b1!4m5!3m4!1s0x0:0x0!8m2!3d${note.latitude}!4d${note.longitude}" target = "_blank">
            <img alt = "== Map ==" align="middle" src = "resources/images/map.gif">
          </a></c:if></div> </td>
          <td> <div style="height:207px; overflow:auto"> ${note.date}</div> </td>
          <td> <div style="height:207px; overflow:auto"> ${note.placeDescription}</div> </td>
           <td>

        <sf:form action="comments" method="get">
          <input type = "hidden" name = "noteId" value="${note.id}">
          <button type="submit" class="button">Просмотр | Комментарии</button>
        </sf:form>
            <div style="height:207px; overflow:auto"> ${note.action} </div> </td>
          <td><div style="height:207px; overflow:auto">
          <c:forEach items="${photos}" var="photo">
          <c:if test="${note.id == photo.noteId}">
          <a href = "/image/${photo.id}" title = "рисунок" target = "_blank" > <img  alt = "image" height = "100"  src="/image/${photo.id}" /></a>
          </c:if>
          </c:forEach>
          </div></td>
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
  </c:forEach>
  </table>
</body>
</html>