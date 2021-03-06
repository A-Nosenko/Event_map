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

<table>
<c:forEach items="${users}" var="user">

  <tr>
    <td width="10%">
         <img  alt = "image" width="100%"  src="/userImage/${user.login}" />
    </td>
  <td width="20%">
    ${user.login}
    </td>

    <td width="20%">
      ${user.email}
    </td>

    <td width="10%">
      <c:if test = "${pageContext.request.remoteUser != user.login}" >
        <sf:form action="/dialog" method="post">
          <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
          <input type="hidden" name="userNameTo" value="${user.login}"/>
          <button type="submit" class="button"><st:message code="button.message"/></button>
        </sf:form>
      </c:if>
    </td>

    <td width="10%">
${user.roles}
    </td>

    <td width="15%">
<sf:form action="/ban" method="post" >
  <input type="hidden" name="id" value="${user.id}">
  <button type="submit" class="button"><st:message code="button.ban"/></button>
</sf:form>

      <sf:form action="/unBan" method="post" >
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit" class="button"><st:message code="button.unBan"/></button>
      </sf:form>

    </td>

    <td width="10%">

    </td>

  </tr>

</c:forEach>
  </table>

</body>
</html>
