<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta username="viewport" content="width=device-width, initial-scale=1"/>
    <title>登录 - Go购书</title>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".close").click(function () {
                $("#alert").alert();
            });
        });
    </script>

    <style>
        #shop_body {
            margin: 35px auto;
        }

        #shop_body .title {
            margin: 30px 10px;
            color: rgba(85, 85, 85, 0.8);
        }
    </style>
</head>
<%@include file="head.jsp" %>
<body>
<div id="shop_body" style="width: 400px;">
    <h3 class="title">登录</h3>
    <form action="${pageContext.request.contextPath}/userLoginServlet" method="post">
        <div class="form-group">
            <label for="user">用户名：</label>
            <input type="text" name="username" class="form-control" id="user" placeholder="请输入用户名" required/>
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码" required/>
        </div>

        <hr/>
        <div class="form-group">
            <input class="btn btn btn-primary" type="submit" value="登 录">&nbsp;
            <input class="btn btn btn-default" type="button" value="没有账号？请注册" onclick="window.location.href='register.jsp'">
            <input class="btn btn btn-default" type="button" value="管理员登录" onclick="window.location.href='adminLogin.jsp'">
        </div>
    </form>

    <!-- 出错显示的信息框 -->
    <div id="alert" class="alert alert-warning">
        <a class="close" data-dismiss="alert">&times;</a>
        <strong>登陆失败！</strong>${login_msg}
    </div>
</div>
</body>
<%@include file="footer.jsp" %>
<script>
    if ("${login_msg}" == "") {
        $('#alert').addClass("hide");
    }
</script>
</html>