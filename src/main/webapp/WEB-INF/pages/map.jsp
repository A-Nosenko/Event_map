<%@ include file="/WEB-INF/pages/jspf/taglib.jspf" %>
<html>
<head>
  <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
  <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
  <script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyAstb_zkWsEU3szOJ6ti59x_sZVDBCAX40"></script>

  <title>==EVENT_MAP==</title>
</head>
<body>
<p id="markers">${markers}</p>
<p id="JSONObject">${JSONObject}</p>

<div id="leftHeader">
  <a href="/"><img src="resources/images/ref.gif"></a>
</div>
<div id="rightHeader">

  <sf:form  action="/register" method="get">
  <button type="submit" class="button"><st:message code="button.registration"/></button>
  </sf:form>

  <br/>
  <c:if test = "${pageContext.request.remoteUser != null}" >
    <st:message code="message.yourLogin"/>  <c:out value="${pageContext.request.remoteUser}       "/>
  <sf:form action="/logout" method="post">
  <button type= "submit" class="button"><st:message code="button.exit"/> </button>
  </sf:form>
  <sf:form action="/account" method="post">
  <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
  <button type= "submit" class="button"><st:message code="button.area"/></button>
  </sf:form>
  </c:if>

  <c:if test = "${pageContext.request.remoteUser == null}" >
  <sf:form action="/login" method="get">
  <button type= "submit" class="button"><st:message code="button.login"/></button>
  </sf:form>
  </c:if>

  <sf:form  action="/app" method="get">
  <button type="submit" class="button"><st:message code="button.eventList"/></button>
  </sf:form>

  <security:authorize access = "hasRole('ROLE_ADMIN')">
  <sf:form  action="/admin" method="post">
  <button type="submit" class="button"><st:message code="button.adminPage"/></button>
  </sf:form>
  </security:authorize>
</div>
<div id="map"></div>
<script type="text/javascript" src = "resources/js/markers.js">

</script>

=====================================================<br/>
JSON from method new Gson().toJson(latLngService.getLatLng():
<br/>
<br/>
${json}

<br/>
=====================================================<br/>
from toString() conversion:
<br/>
${markers}
<br/>
=====================================================<br/>
JSONobject <br/>
${JSONObject}
<br/>
</body>
</html>
