<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta username="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录 - Go购书</title>

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
            margin: 100px auto;
            padding: 40px;
            border: #b6b6b6 solid 1px;
            border-radius: 10px;
            width: 480px;
        }

        #shop_body .title {
            margin: 30px auto;
            text-align: center;
            color: rgba(85, 85, 85, 0.8);
        }
    </style>
</head>

<body>
<div id="shop_body">
    <h3 class="title">管理员登录</h3>
    <form action="${pageContext.request.contextPath}/adminLoginServlet" method="post">
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
            <input class="btn btn btn-default" type="button" value="用户登录" onclick="window.location.href='login.jsp'">
        </div>
    </form>

    <!-- 出错显示的信息框 -->
    <div id="alert" class="alert alert-warning">
        <a class="close" data-dismiss="alert">&times;</a>
        <strong>登陆失败！</strong>${login_msg}
    </div>
</div>
</body>

<script>
    if ("${login_msg}" == "") {
        $('#alert').addClass("hide");
    }
</script>
</html>