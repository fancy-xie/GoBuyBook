<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta username="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>个人信息 - Go购书</title>

    <style>
        #shop_body {
            width: 800px;
            margin: 35px auto 120px;
        }

        #shop_body .title {
            margin: 30px 10px;
            color: rgba(85, 85, 85, 0.8);
        }

        .info-button {
            float: right;
        }
    </style>

</head>
<%@include file="head.jsp" %>
<body>
<div id="shop_body">
    <h3 class="title">个人信息</h3>
    <table class="table table-striped table-bordered">
        <tr>
            <td>
                <b>ID</b>
            </td>
            <td>
                <b class="form-control-static">${user.getId()}</b>
            </td>
        </tr>
        <tr>
            <td>
                <b>用户名</b>
            </td>
            <td>
                <b class="form-control-static">${user.getUsername()}</b>
            </td>
        </tr>
        <tr>
            <td>
                <b>姓名</b>
            </td>
            <td>
                <p class="form-control-static">${user.getTrueName()}</p>
            </td>
        </tr>
        <tr>
            <td>
                <b>手机号</b>
            </td>
            <td>
                <p class="form-control-static">${user.getPhone()}</p>
            </td>
        </tr>
        <tr>
            <td>
                <b>城市</b>
            </td>
            <td>
                <p class="form-control-static">${user.getCity()}</p>
            </td>
        </tr>
        <tr>
            <td>
                <b>地址</b>
            </td>
            <td>
                <p class="form-control-static">${user.getAddress()}</p>
            </td>
        </tr>
    </table>
    <div class="form-group info-button">
        <input class="btn btn btn-default" type="button" value="修改密码" onclick="location.href='modUserPassword.jsp'">&nbsp;
        <input class="btn btn btn-primary" type="button" value="修改信息" onclick="location.href='modUserInfo.jsp'">
    </div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>
