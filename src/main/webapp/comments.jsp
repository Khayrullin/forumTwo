<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: habar
  Date: 06.11.2016
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${theme.theme}</title>
</head>
<body>


<div class="row">
    <div class="col-sm-1"></div>
    <div class="col-sm-10">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <p><b>Theme:  ${theme.theme}</b></p>
                Details:  theme.message}<br><br>
                <div class="col-sm-3">


                </div>
            </div>
        </div>


        <c:forEach var="comment" items="${commentList}">
            <br>

            <form action="userSettings" method="post">
                <button type="submit" class="btn btn-link" name="username"
                        value="${comment.autor}">${comment.autor}</button>
            </form>
            ${comment.date}<br>


            ${comment.comment} <br>


        </c:forEach>

        <c:if test="${user!=null}">

            <br>

            <br>


            <div class="panel panel-default">
                <div class="panel-body">
                    <form accept-charset="UTF-8" action="comments" method="post">
                            <textarea class="form-control counted" name="message" placeholder="Leave A comment"
                                      rows="5" style="margin-bottom:10px;"></textarea>
                        <h6 class="pull-right" id="counter">255 characters remaining</h6>
                        <button class="btn btn-info" type="submit" name="id" value="${theme.id}">Answer</button>
                    </form>

                </div>
            </div>
        </c:if>
    </div>


</div>
<div class="col-sm-1"></div>
</div>

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


</script>


</body>
</html>
