<%--
  Created by IntelliJ IDEA.
  User: habar
  Date: 30.10.2016
  Time: 11:36
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
    <link href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumboron.css" rel="stylesheet">
    <title>Dialog</title>

    <style type="text/css">
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>


<div class="row">
    <div class="col-sm-1"></div>
    <div class="col-sm-10">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <p><b>Chat with ${receiver}:</b></p>
                <div class="col-sm-3">


                </div>
            </div>
        </div>


        <c:if test="${user.isYou(sessionUser)}">

        <c:forEach var="message" items="${messages}">

            ${message.sender} ${message.date}<br>

            ${message.message}<br>
            <br>
            <br>


        </c:forEach>
        <span id="result"></span>


        <div class="panel panel-default">
            <div class="panel-body">


                <form accept-charset="UTF-8" action="dialog" method="POST" id="form">
                            <textarea class="form-control counted" id="message" name="message"
                                      placeholder="Type in your message"
                                      rows="5" style="margin-bottom:10px;"></textarea>
                    <h6 class="pull-right" id="counter">255 characters remaining</h6>
                    <button class="btn btn-info" type="button" id="button">Send
                        Message
                    </button>
                </form>


            </div>
        </div>
    </div>


    </c:if>


</div>
<div class="col-sm-1"></div>
</div>
<script src="webjars/bootstrap-growl/2.0.1/bootstrap-growl.min.js"></script>

<script src="webjars/jquery/1.11.1/jquery.js"></script>
<script src="webjars/jquery-ui/1.11.3/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/i18n/jquery-ui-i18n.min.js"></script>
<script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.js"></script>

<script>


    /**
     *
     * jquery.charcounter.js version 1.2
     * requires jQuery version 1.2 or higher
     * Copyright (c) 2007 Tom Deater (http://www.tomdeater.com)
     * Licensed under the MIT License:
     * http://www.opensource.org/licenses/mit-license.php
     *
     */

    (function ($) {
        /**
         * attaches a character counter to each textarea element in the jQuery object
         * usage: $("#myTextArea").charCounter(max, settings);
         */

        $.fn.charCounter = function (max, settings) {
            max = max || 100;
            settings = $.extend({
                container: "<span></span>",
                classname: "charcounter",
                format: "(%1 characters remaining)",
                pulse: true,
                delay: 0
            }, settings);
            var p, timeout;

            function count(el, container) {
                el = $(el);
                if (el.val().length > max) {
                    el.val(el.val().substring(0, max));
                    if (settings.pulse && !p) {
                        pulse(container, true);
                    }
                    ;
                }
                ;
                if (settings.delay > 0) {
                    if (timeout) {
                        window.clearTimeout(timeout);
                    }
                    timeout = window.setTimeout(function () {
                        container.html(settings.format.replace(/%1/, (max - el.val().length)));
                    }, settings.delay);
                } else {
                    container.html(settings.format.replace(/%1/, (max - el.val().length)));
                }
            };

            function pulse(el, again) {
                if (p) {
                    window.clearTimeout(p);
                    p = null;
                }
                ;
                el.animate({opacity: 0.1}, 100, function () {
                    $(this).animate({opacity: 1.0}, 100);
                });
                if (again) {
                    p = window.setTimeout(function () {
                        pulse(el)
                    }, 200);
                }
                ;
            };

            return this.each(function () {
                var container;
                if (!settings.container.match(/^<.+>$/)) {
                    // use existing element to hold counter message
                    container = $(settings.container);
                } else {
                    // append element to hold counter message (clean up old element first)
                    $(this).next("." + settings.classname).remove();
                    container = $(settings.container)
                            .insertAfter(this)
                            .addClass(settings.classname);
                }
                $(this)
                        .unbind(".charCounter")
                        .bind("keydown.charCounter", function () {
                            count(this, container);
                        })
                        .bind("keypress.charCounter", function () {
                            count(this, container);
                        })
                        .bind("keyup.charCounter", function () {
                            count(this, container);
                        })
                        .bind("focus.charCounter", function () {
                            count(this, container);
                        })
                        .bind("mouseover.charCounter", function () {
                            count(this, container);
                        })
                        .bind("mouseout.charCounter", function () {
                            count(this, container);
                        })
                        .bind("paste.charCounter", function () {
                            var me = this;
                            setTimeout(function () {
                                count(me, container);
                            }, 10);
                        });
                if (this.addEventListener) {
                    this.addEventListener('input', function () {
                        count(this, container);
                    }, false);
                }
                ;
                count(this, container);
            });
        };

    })(jQuery);

    $(function () {
        $(".counted").charCounter(320, {container: "#counter"});
    });


    $(document).ready(function () {

        $("#form").validate({

            rules: {


                message: {
                    required: true,
                    minlength: 20,
                    maxlength: 999,
                },
            },

            messages: {


                message: {
                    required: "Это поле обязательно для заполнения",
                    minlength: "Пароль должен быть минимум 20 символа",
                    maxlength: "Пароль должен быть максимум 999 символов",
                },

            }

        });

    });

    $(document).ready(function () {
        $("#button").click(function () {


            $.ajax({
                type: 'POST',
                url: 'coden?message=' + $('#message').val() + '&receiver=' +"${receiver}",
                success: function (data) {
                    $('#result').append(data);
                    $('#message').val('')

                }

            });

        })
    });

</script>

</body>
</html>
