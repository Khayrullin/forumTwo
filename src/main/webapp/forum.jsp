<%--
  Created by IntelliJ IDEA.
  User: habar
  Date: 04.11.2016
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="i18n.UsersBundle"/>

<html>
<head>
    <title>Theme List</title>
</head>
<body>


<c:if test="${user!=null}">

    <form action="createTheme.jsp">
        <button type="submit" class="btn btn-success">Create Theme</button>
    </form>

</c:if>
<table class="table table-bordered table-striped">
    <tr>
        <th>Theme</th>
        <th>Autor</th>
        <th>Date</th>
    </tr>

    <c:forEach var="theme" items="${themes}">
        <tr>
            <td>
                <a href="comments?id=${theme.id}"> ${theme.theme} </a>
            </td>
            <td>
                <form action="userSettings" method="post">
                    <button type="submit" class="btn btn-link" name="username"
                            value="${theme.autor}">${theme.autor}</button>
                </form>
            </td>
            <td>
                    ${theme.date}

                <c:if test="${user.isModerator()}">
                    <form action="deleteTheme" method="get">
                        <button type="submit" class="btn btn-link" name="themeId"
                                value="${theme.id}">Delete
                        </button>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:forEach>


</table>

<form action="themes" method="get">
    <div class="btn-group">

        <c:forEach var="page" items="${pages}">


            <button type="submit" id="whichPage" class="btn btn-default" value="${page}"
                    name="whichPage">${page}</button>


        </c:forEach>

    </div>
</form>
</body>
</html>