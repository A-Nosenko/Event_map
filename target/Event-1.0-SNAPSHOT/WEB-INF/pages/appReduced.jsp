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
<table>
    <tr><td width="70%">
        <c:if test = "${pageContext.request.remoteUser == null}" >
            <h2>

                <li>You can view the description of events,
                    search by keyword, author's login or event date.</li>
                <li>To publish your notes and comments you need to register on the site.</li>
                <li>The administration of the site is not responsible for the information
                    posted by users.</li>
            </h2>
        </c:if>

        <c:if test = "${pageContext.request.remoteUser != null}" >
            <h2>

                <li>You can view the description of events,
                    search by keyword, author's login or event date.</li>
                <li>The administration of the site is not responsible for the information
                    posted by users.</li>

            </h2>

            <sf:form action="/dialog" method="post">
                <li>If you have any questions, wishes, write please</li>
                <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                <input type="hidden" name="userNameTo" value="Admin"/>
                <button type="submit" class="button">To admin</button>
            </sf:form>

        </c:if>

    </td><td width="30">
        <div align="right">
            <c:if test = "${pageContext.request.remoteUser != null}" >
                Welcome! <c:out value="${pageContext.request.remoteUser}"/>
                <sf:form action="${contextPath}/logout" method="post">
                    <button type= "submit" class="button">Exit</button>
                </sf:form>
                <sf:form action="/account" method="post">
                    <input type="hidden" name="userName" value="${pageContext.request.remoteUser}"/>
                    <button type= "submit" class="button">My account</button>
                </sf:form>
            </c:if>

            <c:if test = "${pageContext.request.remoteUser == null}" >
                <sf:form  action="/register" method="get">
                    <button type="submit" class="button">Registration</button>
                </sf:form>
                <sf:form class="form-inline" action="/login" method="get">
                    <button type= "submit" class="button"> Login </button>
                </sf:form>
            </c:if>

            <form  action="/app" method="get">
                In the order of the date of the event  <button type="submit" class="button">Show all</button>
            </form>

            <form  action="/appSortByNoteTime" method="get">
                In order of publication <button type="submit" class="button">Show all</button>
            </form>


            <form  action="/addNote" method="get">
                <button type="submit" class="button"> Add new event </button>
            </form>

            <sf:form action="/map" method="post">
                <button type= "submit" class="button"> Look at map </button>
            </sf:form>
        </div>
    </td></tr></table>

<div align="left">
    <sf:form  action="/appSearchByDate" method="post">
        <div>
            <button type="submit" class="button"> Search </button>
            <input type="date" name="pattern" >
        </div>
    </sf:form>
    <sf:form  action="/appSearch" method="post">
        <div>
            <button type="submit" class="button"> Search </button>
            <input type="text" name="pattern" placeholder="Event keywords">
        </div>
    </sf:form>
    <sf:form  action="/appSearchByLogin" method="post">
        <div>
            <button type="submit" class="button"> Search </button>
            <input type="text" name="pattern" placeholder="User login">
        </div>
    </sf:form>
    <sf:form  action="/appSearchByAddress" method="post">
        <div>
            <button type="submit" class="button"> Search </button>
            <input type="text" name="pattern" placeholder="Search by address">
        </div>
    </sf:form>
</div>

<div align="center">
    <c:if test="${flagPrev}">
        <sf:form action="/app" method="post">
            <input type="hidden" name="isNext" value="false">
            <input type="hidden" name="count" value="${count}">
            <input type="hidden" name="counter" value="${counter}">
            <button type="submit" class="button"> SHOW PREVIOUS </button>
        </sf:form>
    </c:if>
</div>

<table width = "100%">
    <thead><tr>
        <td width="10%">    </td>
        <td width="5%">   </td>
        <td width="10%"> Date </td>
        <td width="10%"> Address </td>
        <td width="50%"> Event </td>
        <td width="5%">  </td>
        <td width="10%">     </td>
    </tr></thead>

    <c:forEach items="${fullNoteList}" var="fullNote">
        <tr>
            <td> <div>
                <img  alt = "image" width="100%"  src="/userImage/${fullNote.note.userName}" />
                    ${fullNote.note.userName}<br/>
                <c:if test = "${pageContext.request.remoteUser != fullNote.note.userName}" >
                    <sf:form action="/dialog" method="post">
                        <input type="hidden" name="userNameFrom" value="${pageContext.request.remoteUser}"/>
                        <input type="hidden" name="userNameTo" value="${fullNote.note.userName}"/>
                        <button type="submit" class="button">Message</button>
                    </sf:form>
                </c:if>

                <fmt:formatDate value="${fullNote.note.note_time}" pattern="dd-MM-yyyy HH:mm:ss" /> </div>

            </td>
            <td> <div style="height:207px; overflow:auto"><c:if test="${not empty fullNote.note.latitude and not empty fullNote.note.longitude}">
                <a href = "https://www.google.com.ua/maps/place/@${fullNote.note.latitude},${fullNote.note.longitude},291m/data=!3m2!1e3!4b1!4m5!3m4!1s0x0:0x0!8m2!3d${fullNote.note.latitude}!4d${fullNote.note.longitude}" target = "_blank">
                    <img alt = "== Map ==" align="middle" src = "resources/images/map.gif">
                </a></c:if></div> </td>
            <td> <div style="height:207px; overflow:auto"> ${fullNote.note.date}</div> </td>
            <td> <div style="height:207px; overflow:auto"> ${fullNote.note.placeDescription}</div> </td>
            <td>


                Comments: ${fullNote.commentCount}

                <sf:form action="comments" method="get">
                    <input type = "hidden" name = "noteId" value="${fullNote.note.id}">
                    <button type="submit" class="button"> View | Comments</button>
                </sf:form>
                <div style="height:207px; overflow:auto"> ${fullNote.note.action} </div> </td>
            <td><div style="height:207px; overflow:auto">

            </div></td>
            <td>
                <c:if test="${pageContext.request.remoteUser == fullNote.note.userName}">
                    <sf:form  action="/delete" method="post">
                        <input type = "hidden" name = "id" value="${fullNote.note.id}">
                        <button type="submit" class="button">Delete</button>
                    </sf:form>
                </c:if>

                <security:authorize access = "hasRole('ROLE_ADMIN')">
                    <sf:form  action="/delete" method="post">
                        <input type = "hidden" name = "id" value="${fullNote.note.id}">
                        <button type="submit" class="button">Delete</button>
                    </sf:form>
                </security:authorize>

                <c:if test="${pageContext.request.remoteUser == fullNote.note.userName}">
                    <sf:form action="noteViewAndAlter" method="get">
                        <input type = "hidden" name = "id" value="${fullNote.note.id}">
                        <button type="submit" class="button">Correct</button>
                    </sf:form>
                </c:if>
            </td></tr>
    </c:forEach>
</table>

<div align="center">
    <c:if test="${flagNext}">
        <sf:form action="/app" method="post">
            <input type="hidden" name="isNext" value="true">
            <input type="hidden" name="count" value="${count}">
            <input type="hidden" name="counter" value="${counter}">
            <button type="submit" class="button"> SHOW NEXT </button>
        </sf:form>
    </c:if>
</div>

</body>
</html>