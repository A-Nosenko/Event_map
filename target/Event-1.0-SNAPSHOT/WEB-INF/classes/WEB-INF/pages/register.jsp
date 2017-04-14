<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/2/2017
  Time: 09:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
<div align = "right">
  <form  action="/app" method="get">
    <button type="submit" class="button">_EVENT MAP</button>
  </form>
</div>
<div align="center">
<sf:form modelAttribute="user" method="post">
  <table>
    <tr>
      <td><br/>*Логин:<br/></td>
      <td><br/><sf:input path="login"/></td>
      <td><br/><span class="error"><sf:errors path="login" /></span></td>
    </tr>

    <tr>
      <td><br/>*Пароль:<br/></td>
      <td><br/><sf:password path="password" /></td>
      <td><br/><span class="error"><sf:errors path="password" /></span></td>
      </tr>

    <tr>
      <td><br/>*Повторите пароль:<br/></td>
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
        <label for = "remember_me">Запомнить меня</label><br/>
        <br/><button value="submit" class="button">Зарегестрироваться</button>
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <br/> * Поля, обязательные к заполнению.
      </td>
    </tr>

  </table>
</sf:form>
</div>
</body>
</html>