<%--
  Created by IntelliJ IDEA.
  User: ENTITY
  Date: 2/16/2017
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/pages/jspf/taglib.jspf" %>
<html>
<head>
    <title>==EVENT_MAP==</title>
    <link href="<c:url value=" resources
    /css/highslide.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value=" resources
    /css/highslide-ie6.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value=" resources
    /css/s.css" />" rel="stylesheet" type = "text/css">
    <link href="<c:url value=" resources
    /images/head.ico" />" rel="shortcut icon" type="image/x-icon">

    <script type="text/javascript" src="resources/js/highslide-full.js"></script>
    <script type="text/javascript" src="resources/js/slide.js"></script>


</head>
<body>
<div id="rightHeader">
    <%@ include file="/WEB-INF/pages/jspf/select.jspf" %>
</div>
<div align="left">
    <a href="/"><img src="resources/images/ref.gif"></a>
</div>
<table>
    <tr>
        <td width="70%">
            <c:if test="${pageContext.request.remoteUser == null}">
                <h2>
                    <li><st:message code="app.li.1"/></li>
                    <li><st:message code="app.li.2"/></li>
                    <li><st:message code="app.li.3"/></li>
                </h2>
            </c:if>

            <c:if test="${pageContext.request.remoteUser != null}">
                <h2>
                    <li><st:message code="app.li.1"/></li>
                    <li><st:message code="app.li.3"/></li>
                </h2>

                <sf:form action="/dialog" method="post">
                    <li><st:message code="message.toAdmin"/></li>
                    <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                    <input type="hidden" name="userNameTo" value="Admin"/>
                    <button type="submit" class="button"><st:message code="button.toAdmin"/></button>
                </sf:form>

            </c:if>

        </td>
        <td width="30">
            <div align="right">
                <c:if test="${pageContext.request.remoteUser != null}">
                    <st:message code="message.welcome"/> <c:out value="${pageContext.request.remoteUser}"/>
                    <sf:form action="${contextPath}/logout" method="post">
                        <button type="submit" class="button"><st:message code="button.exit"/></button>
                    </sf:form>
                    <sf:form action="/account" method="post">
                        <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
                        <button type="submit" class="button"><st:message code="button.area"/></button>
                    </sf:form>
                </c:if>

                <c:if test="${pageContext.request.remoteUser == null}">
                    <sf:form action="/register" method="get">
                        <button type="submit" class="button"><st:message code="button.registration"/></button>
                    </sf:form>
                    <sf:form class="form-inline" action="/login" method="get">
                        <button type="submit" class="button"><st:message code="button.login"/></button>
                    </sf:form>
                </c:if>

                <form action="/app" method="get">
                    <st:message code="message.dateOrder"/><br/>
                    <button type="submit" class="button"><st:message code="button.show"/></button>
                </form>

                <form action="/appSortByNoteTime" method="get">
                    <st:message code="message.datePublish"/><br/>
                    <button type="submit" class="button"><st:message code="button.show"/></button>
                </form>


                <form action="/addNote" method="get">
                    <button type="submit" class="button"><st:message code="button.newEvent"/></button>
                </form>

                <sf:form action="/map" method="post">
                    <button type="submit" class="button"><st:message code="button.eventMap"/></button>
                </sf:form>
            </div>
        </td>
    </tr>
</table>

<div align="left">
    <sf:form action="/appSearchByDate" method="post">
        <div>
            <button type="submit" class="button"><st:message code="button.search"/></button>
            <input type="date" name="pattern">
        </div>
    </sf:form>
    <sf:form action="/appSearch" method="post">
        <div>
            <button type="submit" class="button"><st:message code="button.search"/></button>
            <input type="text" name="pattern" placeholder=<st:message code="holder.keywords"/>>
        </div>
    </sf:form>
    <sf:form action="/appSearchByLogin" method="post">
        <div>
            <button type="submit" class="button"><st:message code="button.search"/></button>
            <input type="text" name="pattern" placeholder=<st:message code="holder.login"/>>
        </div>
    </sf:form>
    <sf:form action="/appSearchByAddress" method="post">
        <div>
            <button type="submit" class="button"><st:message code="button.search"/></button>
            <input type="text" name="pattern" placeholder=<st:message code="holder.address"/>>
        </div>
    </sf:form>
</div>

<div align="center">
    <c:if test="${flagPrev}">
        <sf:form action="/app" method="post">
            <input type="hidden" name="isNext" value="false">
            <input type="hidden" name="count" value="${count}">
            <input type="hidden" name="counter" value="${counter}">
            <button type="submit" class="button"><st:message code="button.previous"/></button>
        </sf:form>
    </c:if>
</div>

<div align="center">
    <table width="100%">
        <thead>
        <tr>
            <td width="10%"></td>
            <td width="5%"></td>
            <td width="10%"><st:message code="message.date"/></td>
            <td width="10%"><st:message code="message.address"/></td>
            <td width="20%"><st:message code="message.event"/></td>
            <td width="30%"></td>
            <td width="15%"></td>
        </tr>
        </thead>

        <c:forEach items="${fullNoteList}" var="fullNote">
            <script type="text/javascript">
                counter++;
            </script>
            <tr>
                <td>
                    <div>
                        <img alt="image" width="100%" src="/userImage/${fullNote.note.userName}"/>
                        ${fullNote.note.userName}<br/>
                        <c:if test="${pageContext.request.remoteUser != fullNote.note.userName}">
                            <sf:form action="/dialog" method="post">
                                <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                                <input type="hidden" name="userNameTo" value="${fullNote.note.userName}"/>
                                <button type="submit" class="button"><st:message code="button.message"/></button>
                            </sf:form>
                        </c:if>

                        <fmt:formatDate value="${fullNote.note.note_time}" pattern="dd-MM-yyyy HH:mm:ss"/></div>

                </td>
                <td>
                    <div style="height:207px; overflow:auto"><c:if
                            test="${not empty fullNote.note.latitude and not empty fullNote.note.longitude}">
                        <a href="https://www.google.com.ua/maps/place/@${fullNote.note.latitude},${fullNote.note.longitude},291m/data=!3m2!1e3!4b1!4m5!3m4!1s0x0:0x0!8m2!3d${fullNote.note.latitude}!4d${fullNote.note.longitude}"
                           target="_blank">
                            <img alt="== Map ==" align="middle" src="resources/images/map.gif">
                        </a></c:if></div>
                </td>
                <td>
                    <div style="height:207px; overflow:auto"> ${fullNote.note.date}</div>
                </td>
                <td>
                    <div style="height:207px; overflow:auto"> ${fullNote.note.placeDescription}</div>
                </td>
                <td>


                    <st:message code="message.comments"/>: ${fullNote.commentCount}

                    <sf:form action="comments" method="get">
                        <input type="hidden" name="noteId" value="${fullNote.note.id}">
                        <button type="submit" class="button"><st:message code="button.viewComments"/></button>
                    </sf:form>

                    <div style="height:207px; overflow:auto"> ${fullNote.note.action} </div>
                </td>
                <td>
                    <div style="height:207px; overflow:auto">
                        <fieldset>
                            <legend><st:message code="message.photo"/></legend>
                            <c:forEach items="${photos}" var="photo">

                                <c:if test="${fullNote.note.id == photo.noteId}">
                                    <!--a href = "/image/${photo.id}" title = "image" target = "_blank" >
                                <img  alt = "image" height = "100"  src="/image/${photo.id}" /></a-->

                                    <a class="highslide" href="/image/${photo.id}"
                                       onclick="return hs.expand(this, {slideshowGroup: counter})" title="image">
                                        <img alt="image" height="100" src="/image/${photo.id}"/></a>

                                </c:if>
                            </c:forEach>
                        </fieldset>
                    </div>
                </td>
                <td>
                    <c:if test="${pageContext.request.remoteUser == fullNote.note.userName}">
                        <sf:form action="/delete" method="post">
                            <input type="hidden" name="id" value="${fullNote.note.id}">
                            <button type="submit" class="button"><st:message code="button.delete"/></button>
                        </sf:form>
                    </c:if>

                    <security:authorize access="hasRole('ROLE_ADMIN')">
                        <sf:form action="/delete" method="post">
                            <input type="hidden" name="id" value="${fullNote.note.id}">
                            <button type="submit" class="button"><st:message code="button.delete"/></button>
                        </sf:form>
                    </security:authorize>

                    <c:if test="${pageContext.request.remoteUser == fullNote.note.userName}">
                        <sf:form action="noteViewAndAlter" method="get">
                            <input type="hidden" name="id" value="${fullNote.note.id}">
                            <button type="submit" class="button"><st:message code="button.alter"/></button>
                        </sf:form>
                    </c:if>
                </td>
            </tr>

        </c:forEach>
    </table>

</div>

<div align="center">
    <c:if test="${flagNext}">
        <sf:form action="/app" method="post">
            <input type="hidden" name="isNext" value="true">
            <input type="hidden" name="count" value="${count}">
            <input type="hidden" name="counter" value="${counter}">
            <button type="submit" class="button"><st:message code="button.next"/></button>
        </sf:form>
    </c:if>
</div>

</body>
</html>