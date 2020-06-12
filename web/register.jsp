<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta username="viewport" content="width=device-width, initial-scale=1"/>
    <title>注册 - Go购书</title>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/reg.js"></script>
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
    <h3 class="title">注册</h3>
    <form action="${pageContext.request.contextPath}/userRegisterServlet" method="post">
        <div class="form-group">
            <label class="control-label" for="username">用户名：</label>
            <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名" required/>
            <span id="s_username" class="help-block"></span>
        </div>

        <div class="form-group">
            <label class="control-label" for="password1">密码：</label>
            <input type="password" name="password" class="form-control" id="password1" placeholder="请输入密码" required/>
        </div>

        <div class="form-group">
            <label class="control-label" for="password2">确认密码：</label>
            <input type="password" class="form-control" id="password2" placeholder="请再输入一次密码" required/>
            <span id="s_password" class="help-block"></span>
        </div>

        <div class="form-group">
            <label class="control-label" for="truename">真实姓名：</label>
            <input type="text" name="trueName" class="form-control" id="truename" placeholder="请输入真实姓名" required/>
        </div>

        <div class="form-group">
            <label class="control-label" for="phone">手机号：</label>
            <input type="text" name="phone" class="form-control" id="phone" placeholder="请输入手机号" required/>
        </div>

        <div class="form-group">
            <label class="control-label" for="city">城市：</label>
            <input type="text" name="city" class="form-control" id="city" placeholder="请输入城市" required/>
        </div>

        <div class="form-group">
            <label class="control-label" for="address">地址：</label>
            <input type="text" name="address" class="form-control" id="address" placeholder="请输入地址" required/>
        </div>

        <hr/>
        <div class="form-group">
            <input id="regButton" class="btn btn btn-primary" type="submit" value="注 册">&nbsp;
            <input class="btn btn btn-default" type="button" value="已有账号？请登录"
                   onclick="location.href='login.jsp'">
        </div>
    </form>

    <!-- 出错显示的信息框 -->
    <div id="alert" class="alert alert-warning">
        <a class="close" data-dismiss="alert">&times;</a>
        <strong>注册失败！</strong>${reg_msg}
    </div>
</div>
</body>
<%@include file="footer.jsp" %>
<script>
    if ("${reg_msg}" == "") {
        $('#alert').addClass("hide");
    }
</script>
</html>
