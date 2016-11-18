<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="i18n.UsersBundle"/>

<html>
<head>
    <title>Личный Кабинет</title>
</head>
<body>


<c:if test="${userP.isYou(sessionUser)}">

    <p>
        Firstname: ${userP.firstname}<br>
        Lastname: ${userP.lastname}<br>
        Role: ${userP.role}<br>
        Email: ${userP.email}<br>

    <form action="users" method="get">
        <button type="submit" class="btn btn-success">Change</button>
    </form>

    <br>


    </p>
</c:if>
<c:if test="${!userP.isYou(sessionUser)}">

    <p>
        Firstname: ${userP.firstname}<br>
        Lastname: ${userP.lastname}<br>
        Role: ${userP.role}<br>

    <form action="dialog" method="get">
        <button type="submit" class="btn btn-success" name="receiver" value="${userP.username}">Open a Dialog</button>
    </form>


    </p>
</c:if>


</body>
</html>
