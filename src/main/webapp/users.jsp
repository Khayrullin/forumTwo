<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="i18n.UsersBundle"/>

<html>
<head>
    <title><fmt:message key="users.title"/></title>
</head>
<body>
<table class="table table-bordered table-striped">
    <tr>
        <th><fmt:message key="users.label.username"/></th>
        <th><fmt:message key="users.label.userrole"/></th>
        <th><fmt:message key="users.label.firstname"/></th>
        <th><fmt:message key="users.label.lastname"/></th>
        <th><fmt:message key="users.label.email"/></th>
        <th><fmt:message key="users.label.action"/></th>
    </tr>
    <c:if test="${sessionUser.isAdmin()}">
        <c:forEach var="user" items="${users}">
            <form action="users" method="post">
                <tr>

                    <td>${user.username}</td>
                    <td>
                        <input type="hidden" value="${user.databaseId}" name="dbId">
                        <c:if test="${sessionUser.isAdmin()}">
                            <select name="role">
                                <option ${user.role == 'JUSER' ? 'selected' : ''} value="JUSER">JUser</option>
                                <option ${user.role == 'MODERATOR' ? 'selected' : ''} value="MODERATOR">MODERATOR
                                </option>
                                <option ${user.role == 'ADMIN' ? 'selected' : ''} value="ADMIN">Admin</option>
                            </select>
                        </c:if>
                        <c:if test="${!sessionUser.isAdmin()}">
                            <c:choose>

                                <c:when test="${user.role=='ADMIN'}">
                                    <i>ADMIN</i>
                                </c:when>
                                <c:when test="${user.role=='MODERATOR'}">
                                    <b>MODERATOR</b>
                                </c:when>
                                <c:otherwise>
                                    ${user.role}
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                    </td>

                    <td>
                        <c:if test="${user.isYou(sessionUser)||sessionUser.isAdmin()}">
                            <input type="text" name="firstname" value="${user.firstname}">
                        </c:if>
                        <c:if test="${!user.isYou(sessionUser)&&!sessionUser.isAdmin()}">
                            ${user.firstname}
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${user.isYou(sessionUser)||sessionUser.isAdmin()}">
                            <input type="text" name="lastname" value="${user.lastname}">
                        </c:if>
                        <c:if test="${!user.isYou(sessionUser)&&!sessionUser.isAdmin()}">
                            ${user.lastname}
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${user.isYou(sessionUser)||sessionUser.isAdmin()}">
                            <input type="text" name="email" value="${user.email}">
                        </c:if>
                        <c:if test="${!user.isYou(sessionUser)&&!sessionUser.isAdmin()}">
                            ${user.email}
                        </c:if>

                    </td>
                    <td><c:if test="${user.isYou(sessionUser)||sessionUser.isAdmin()}">
                        <button type="submit" class="btn btn-success"><fmt:message key="users.label.update"/></button>
                    </c:if>
                    </td>

            </form>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${!sessionUser.isAdmin()}">
        <c:forEach var="user" items="${users}">
            <c:if test="${user.isYou(sessionUser)}">
                <form id="form" action="users" method="post">
                    <tr>


                        <td>
                                ${user.username}
                        </td>
                        <td>
                            <input type="hidden" value="${user.databaseId}" name="dbId">
                                ${user.role}

                        </td>


                        <td>
                            <input type="text" name="firstname" value="${user.firstname}">
                        </td>


                        <td>
                            <input type="text" name="lastname" value="${user.lastname}">
                        </td>


                        <td>


                            <input type="text" name="email" value="${user.email}">


                        </td>
                        <td>
                            <button type="submit" class="btn btn-success">
                                <fmt:message key="users.label.update"/></button>

                        </td>


                    </tr>
                </form>
            </c:if>
        </c:forEach>
    </c:if>
</table>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.js"></script>

<script>


    $(document).ready(function () {

        $("#form").validate({

            rules: {

                email: {
                    required: true,
                    minlength: 20,
                    maxlength: 255
                }

            },

            messages: {

                email: {
                    required: "Это поле обязательно для заполнения",
                    minlength: "Логин должен быть минимум 20 символov",
                    maxlength: "Максимальное число символо - 255"
                }


            }

        });

    });

</script>
</body>
</html>
