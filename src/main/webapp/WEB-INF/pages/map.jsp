<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 4/14/2017
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/pages/jspf/taglib.jspf" %>
<html>
<head>
  <title>==EVENT_MAP==</title>
  <link href="<c:url value="resources/css/s.css" />" rel="stylesheet" type = "text/css">
  <link href="<c:url value="resources/images/head.ico" />" rel="shortcut icon" type="image/x-icon">
  <script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyAstb_zkWsEU3szOJ6ti59x_sZVDBCAX40"></script>

</head>
<body>
<%@ include file="/WEB-INF/pages/jspf/select.jspf" %>
<p id="markers">${markers}</p>
<p id="JSONObject">${JSONObject}</p>

<div align="left">
  <a href="/"><img src="resources/images/ref.gif"></a>

  <form  action="/app" method="get">
    <button type="submit" class="button">EVENT LIST</button>
  </form>

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
