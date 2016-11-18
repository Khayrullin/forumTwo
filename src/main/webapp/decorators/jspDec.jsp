<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
           prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="language"
       value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
       scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="i18n.UsersBundle"/>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title><decorator:title/></title>

    <!-- Bootstrap core CSS -->
    <link href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumboron.css" rel="stylesheet">

    <script src="webjars/jquery/1.11.1/jquery.js"></script>
    <script src="webjars/jquery-ui/1.11.3/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/i18n/jquery-ui-i18n.min.js"></script>
    <script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="webjars/jquery-ui/1.11.3/jquery-ui.css" rel="stylesheet">
    <link href="webjars/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet"/>
    <script src="webjars/bootstrap-growl/2.0.1/bootstrap-growl.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


    <![endif]-->
</head>


<body>


<nav class="navbar navbar-inverse navbar-fixed-top">
    <div>
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="themes" class="navbar-brand">Forum</a></li>

                    <c:if test="${user.isAdmin()}">
                        <li><a href="users"><fmt:message key="menu.admin"/></a></li>
                    </c:if>

                </ul>
            </div>


            <c:if test="${user==null}">


                <form class="navbar-form navbar-right" action="login" method=post>
                    <div class="form-group">
                        <input type="text" placeholder="Email" class="form-control" name="j_username" size="25">
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="Password" class="form-control" size="15"
                               name="j_password">
                    </div>
                    <input type="hidden" name="url" value="<%= request.getRequestURI() %>">
                    <button type="submit" class="btn btn-success"><fmt:message key="header.label.signin"/> <i
                            class="fa fa-sign-in"></i></button>
                    <a href="signin" class="btn btn-success"><fmt:message key="header.label.facebook"/> <i
                            class="fa fa-facebook"></i></a>
                    <a href="register" class="btn btn-success"><fmt:message key="header.label.register"/> <i
                            class="fa fa-sign-up"></i></a>
                </form>
            </c:if>

            <!--/.navbar-collapse -->
            <form id="languages" class="navbar-form navbar-right">
                <c:forEach var="par" items="${paramValues}">
                    <c:if test="${!fn:startsWith(par.key, 'language')}">
                        <input type="hidden" name="${par.key}" value="${par.value[0]}">
                    </c:if>
                </c:forEach>
                <div class="form-group">
                    <select class="form-control" id="language" name="language" onchange="submit()"
                            style="font-family: FontAwesome">
                        <option value="en" ${language == 'en' ? 'selected' : ''}>English &#xf1ab;</option>
                        <option value="ru" ${language == 'ru' ? 'selected' : ''}>Русский &#xf1ab;</option>
                    </select>
                </div>

                <c:if test="${user!=null}">

                    <div class="form-group">
                        <a href="logout" class="btn btn-success"><fmt:message key="header.label.logout"/> <i
                                class="fa fa-sign-out"></i></a>
                        <a href="userSettings" class="btn btn-success"> ${user.firstname} ${user.lastname} <i
                                class="fa fa-cog"></i></a>
                    </div>

                </c:if>
            </form>
        </div>
    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <decorator:body/>


    </div>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <h2>О проекте</h2>

            <p>Проект Forum создан для популяризации форумов в республике </p>

            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Авторы</h2>

            <p>Авторами предлагаемых тем являются авторизованные форумчане Гильдии Форумчан Татарстана</p>

            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Посетителям</h2>

            <p>Выбирайте понравившуюся вам тему, добавляйтесь в списки новых тем! Общайтесь с
                нами</p>

            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
    </div>

    <hr>

    <footer>
        <p>&copy; Project Forum 2017</p>
        <script>
            $(function () {
                //setting up Datapicker internationalization + defaults
                $.datepicker.setDefaults(
                        $.extend($.datepicker.regional["${language}"]));
                $(".datepicker").datepicker({
                    minDate: null,
                    maxDate: null, dateFormat: 'yy-mm-dd'
                }).val();

            });


            $(document).ready(function () {
                $("form").submit(function () {
                    var btn = $(this).find("input[type=submit]:focus");
                    $(btn).attr("disabled", "true");
                });
            });
            // disabling form's Submit buttons after the submit
        </script>
    </footer>
</div>
<!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>

