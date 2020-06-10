<%--<!DOCTYPE html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
      <link rel="icon" href="${APP_PATH }/static/favicon.ico">


    <title>奖助学金管理系统——登录</title>

      <% pageContext.setAttribute("APP_PATH",request.getContextPath()); //服务器项目的路径
      %>

    <!-- Bootstrap core CSS -->
    <link href="${APP_PATH }/static/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="${APP_PATH }/static/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${APP_PATH }/static/dist/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="${APP_PATH }/static/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${APP_PATH }/static/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container"  style="width:400px">

        <div align="center">
        <h2 class="form-signin-heading" >奖助学金管理系统</h2>
          <br>
        </div>
        <form class="form-horizontal" id="loginForm">
            <div class="form-group" id="form-group1">
        <label for="inputCount" class="sr-only">count</label>
        <input type="text" id="inputCount" class="form-control inputCount" placeholder="账号" required autofocus name="count">
            <span id="helpBlock1" class="help-block"></span>
        </div>
        <br>
            <div class="form-group" id="form-group2">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control inputPassword" placeholder="密码" required name="password">
            <span id="helpBlock2" class="help-block"></span>
        </div>

        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
          <br>
        </div>

        <div   style="margin-left:80px;">
        <input name="identity" type="radio" value="student" checked="checked" />学生</label>&nbsp &nbsp &nbsp &nbsp
        <input name="identity" type="radio" value="teacher" />老师</label>&nbsp &nbsp &nbsp &nbsp
        <input name="identity" type="radio" value="admin" />教务处 </label>&nbsp &nbsp &nbsp &nbsp
        <br><br>
        </div>
        </form>
        <button class="btn btn-lg btn-primary btn-block login_btn" type="button" id="login_btn">登录</button>
    </div> <!-- /container -->



    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${APP_PATH }/static/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${APP_PATH }/static/assets/js/vendor/jquery.min.js"><\/script>')</script>

    <script type="text/javascript">

        $(document).on("click",".login_btn",function () {
            $("#form-group1").removeClass("has-error");
            $("#form-group2").removeClass("has-error");


            $("#form-grou1").removeClass("has-error");
            $("#helpBlock1").empty();
            $("#form-group2").removeClass("has-error");
            $("#helpBlock2").empty();

            if($("#inputCount").val()==""){
                $("#form-group1").addClass("has-error");
                $("#helpBlock1").text("账号不能为空");
            }
            else if($("#inputPassword").val()==""){
                $("#form-group2").addClass("has-error");
                $("#helpBlock2").text("密码不能为空");
            }
            else {
                $.ajax({
                    url:"${APP_PATH}/login/verify",
                    type:"POST",
                    data:$("#loginForm").serialize(),
                    success:function (result) {
                        if(result.msg=="账号不存在") {
                            $("#form-group1").addClass("has-error");
                            $("#helpBlock1").text("账号不存在");
                        }
                     else if(result.msg=="密码错误"){
                            $("#form-group2").addClass("has-error");
                            $("#helpBlock2").text("密码错误");
                        }
                      else {
                            window.location.href ="${APP_PATH}/login/login1";
                        }
                    }
                });
            }
        });

    </script>


  </body>
</html>
