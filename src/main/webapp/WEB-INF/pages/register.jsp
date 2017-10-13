<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/2/2017
  Time: 09:09
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

<div align="left">
  <a href="/"><img src="resources/images/ref.gif"></a>
</div>
<div align = "right">
  <form  action="/app" method="get">
    <button type="submit" class="button">EVENT LIST</button>
  </form>
</div>
<div align="center">
<sf:form modelAttribute="user" method="post">
  <table>
    <tr>
      <td><br/>*Login:<br/></td>
      <td><br/><sf:input path="login"/></td>
      <td><br/><span class="error"><sf:errors path="login" /></span></td>
    </tr>

    <tr>
      <td><br/>*Password:<br/></td>
      <td><br/><sf:password path="password" /></td>
      <td><br/><span class="error"><sf:errors path="password" /></span></td>
      </tr>

    <tr>
      <td><br/>*Repeated password:<br/></td>
      <td><br/><sf:password path="repeatedPassword" /></td>
      <td><br/><span class="error"><sf:errors
              path="repeatedPassword" /></span></td>
    </tr>

    <tr>
      <td><br/> Email:<br/></td>
      <td><br/><sf:input path="email" /></td>
      <td><br/><span class="error"><sf:errors path="email"  /></span></td>
    </tr>

    <tr>
      <td colspan="3"><br/>
        <input id="remember_me" name="remember-me" type="checkbox"/>
        <label for = "remember_me">Remember me</label><br/>
        <br/><button value="submit" class="button"> Confirm </button>
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <br/> * Required fields.
      </td>
    </tr>

  </table>
</sf:form>
</div>
</body>
</html>
