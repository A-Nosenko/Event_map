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
  <script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyAstb_zkWsEU3szOJ6ti59x_sZVDBCAX40"></script>
  <style type="text/css">
    span.error {
      color: orangered;
    }
    #map {
      height: 90%;
      width: 90%;
      margin: 3rem auto;
    }

    {color: black;}

    p {
      display: none;
    }
  </style>
</head>
<body>
<p id="markers">${getLatLng}</p>
<div id="map"></div>
<script type="text/javascript" src = "resources/js/markers.js">

</script>
</body>
</html>
