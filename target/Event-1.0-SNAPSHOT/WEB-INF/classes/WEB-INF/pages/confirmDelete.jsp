<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 4/29/2017
  Time: 10:59
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


<div align="center">

  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <h2> The theme will be completely deleted, including comments and photos! </h2>
  <br/>
  <br/>

  <div align="center">

    <sf:form  action="/app" method="get">
      <button type="submit" class="button">Cancel</button>
    </sf:form>
  </div>
  <br/>
  <br/>
  <sf:form  action="/deleteTrue" method="post">
    <input type = "hidden" name = "id" value="${id}">
    <button type="submit" class="button">Continue</button>
  </sf:form>

</div>


</body>
</html>
