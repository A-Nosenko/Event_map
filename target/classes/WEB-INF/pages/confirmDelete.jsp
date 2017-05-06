<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 4/29/2017
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>==EVENT_MAP==</title>
  <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
  <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
</head>
<body>


<div align="center">

  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <h2> Тема будет полностью удалена, включая комментарии и фото! </h2>
  <br/>
  <br/>

  <div align="center">

    <sf:form  action="/app" method="get">
      <button type="submit" class="button">Отмена</button>
    </sf:form>
  </div>
  <br/>
  <br/>
  <sf:form  action="/deleteTrue" method="post">
    <input type = "hidden" name = "id" value="${id}">
    <button type="submit" class="button">Продолжить</button>
  </sf:form>

</div>


</body>
</html>
