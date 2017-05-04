<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 3/10/2017
  Time: 23:08
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
    <form  action="/app" method="get">
      <button type="submit" class="button">_EVENT LIST</button>
    </form>
    <c:if test = "${pageContext.request.remoteUser != null}" >
      <sf:form action="/account" method="post">
        <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
        <button type= "submit" class="button">_Мой аккаунт</button>
      </sf:form>
    </c:if>
  </div>
  <sf:form enctype="multipart/form-data" modelAttribute="noteUploader" action="/addNote" method="post">
  <div><h3> Заполните форму: </h3></div>

    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
    <div> Координаты: <br/>Широта <input type="text" name="latitude" placeholder="от -90 до 90"><br/>
                           Долгота <input type="text" name="longitude" placeholder="от -180 до 180"></div>
    <br/>
    Для широты используйте значения в диапазоне от -90 до 90.<br/>
    Долготу указывайте в диапазоне от -180 до 180.<br/><br/>
    <div> Адрес или описание места: <br/> <textarea cols="100" rows="3" name="placeDescription"></textarea></div>
    <br/>
    <div> Дата: <br/> <input type="date" name="date"></div>
    <br/>
    <div> Событие: <br/> <textarea cols="100" rows="10" name="action"></textarea></div>
    <br/>

    <div>Фото 1:  <input type="file" name="files[0]" /></div>
    <div>Фото 2:  <input type="file" name="files[1]" /></div>
    <div>Фото 3:  <input type="file" name="files[2]" /></div>
    <div>Фото 4:  <input type="file" name="files[3]" /></div>
    <div>Фото 5:  <input type="file" name="files[4]" /></div>


  <div><button type="submit" class="button">Опубликовать</button></div>
  </sf:form>

</body>
</html>





