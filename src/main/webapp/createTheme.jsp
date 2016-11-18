<%--
  Created by IntelliJ IDEA.
  User: habar
  Date: 06.11.2016
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Theme</title>
    <link href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumboron.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading clearfix">
                <h3 class="panel-title">Theme Creation Form</h3>
            </div>
            <div class="panel-body">
                <form role="form" class="form-horizontal" id="form" action="themes" method="post">
                    <div class="form-group">
                        <label class="col-sm-2" for="inputSubject">Theme</label>
                        <div class="col-sm-10"><input type="text" class="form-control"  name="theme" id="inputSubject"
                                                      placeholder="Main theme"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-12" for="inputBody">Message</label>
                        <div class="col-sm-12">

                            <textarea class="form-control" name="message"  id="inputBody" rows="8" data-gramm="true"
                                      data-txt_gramm_id="71c8bb8e-8a51-c867-6c4f-5b14b864ac06"
                                      data-gramm_id="71c8bb8e-8a51-c867-6c4f-5b14b864ac06" spellcheck="false"
                                      data-gramm_editor="true" placeholder="Details"
                                      style="z-index: auto; position: relative; line-height: 26.6667px; font-size: 14px; transition: none; overflow: auto; background: transparent !important;"></textarea>
                            <div>
                                <button type="submit" class="btn btn-success">Create</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.js"></script>


<script>

    $(document).ready(function () {

        $("#form").validate({

            rules: {

                theme: {
                    required: true,
                    minlength: 20,
                    maxlength: 150,
                },

                message: {
                    required: true,
                    minlength: 20,
                    maxlength: 999,
                },
            },

            messages: {

                theme: {
                    required: "Это поле обязательно для заполнения",
                    minlength: "Theme должен быть минимум 20 символов",
                    maxlength: "Максимальное число символов - 150",
                },

                message: {
                    required: "Это поле обязательно для заполнения",
                    minlength: "Message должен быть минимум 20 символа",
                    maxlength: "message должен быть максимум 999 символов",
                },

            }

        });

    });
</script>
</body>
</html>
