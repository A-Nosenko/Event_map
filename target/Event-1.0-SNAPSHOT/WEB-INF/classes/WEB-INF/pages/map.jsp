<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 4/14/2017
  Time: 18:41
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
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
  <style type="text/css">
    span.error {
      color: orangered;
    }

  </style>

</head>
<body>

<script>
/*
  $.get('http://localhost:8044/getLatLng').done(function(data){
    console.log(data);
  }).fail(function(xhr, textStatus, errorThrown) {
    console.log("GET failed");
    console.log(xhr.responseText, textStatus, errorThrown);
  });
  */
</script>

<script>

  $.getJSON('/getJson').done(function(data){
    console.log(data);
  }).fail(function(xhr, textStatus, errorThrown) {
    console.log("GET failed");
    console.log(xhr.responseText, textStatus, errorThrown);
  });



  $.getJSON('/getLatLng').done(function(data){
    console.log(data);
  }).fail(function(xhr, textStatus, errorThrown) {
    console.log("GET failed");
    console.log(xhr.responseText, textStatus, errorThrown);
  });

</script>

Это преобразование LatLng в JSON : <br/>${getJson}
=========================
Это прописал в LatLng метод toString(), и скрипт читает его как такой же JSON: <br/>  ${getLatLng}
</body>
</html>
