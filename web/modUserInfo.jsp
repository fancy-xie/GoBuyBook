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
    <title>修改信息 - Go购书</title>

    <style>
        #shop_body {
            width: 800px;
            margin: 35px auto 180px;
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
    <h3 class="title">修改个人信息</h3>
    <form action="userModifyServlet" method="post">
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
                <input type="text" name="username" class="form-control col-lg-7" placeholder="请输入姓名" value="${user.getTrueName()}" required/>
            </td>
        </tr>
        <tr>
            <td>
                <b>手机号</b>
            </td>
            <td>
                <input type="text" name="phone" class="form-control" placeholder="请输入手机号" value="${user.getPhone()}" required/>
            </td>
        </tr>
        <tr>
            <td>
                <b>城市</b>
            </td>
            <td>
                <input type="text" name="city" class="form-control" placeholder="请输入城市" value="${user.getCity()}" required/>
            </td>
        </tr>
        <tr>
            <td>
                <b>地址</b>
            </td>
            <td>
                <input type="text" name="address" class="form-control" placeholder="请输入地址" value="${user.getAddress()}" required/>
            </td>
        </tr>
    </table>
    <div class="form-group info-button">
        <input class="btn btn btn-default" type="button" value="返 回" onclick="location.href='userInfo.jsp'">&nbsp;
        <input class="btn btn btn-primary" type="submit" value="提 交">
    </div>
    </form>
</div>
</body>
<%@include file="footer.jsp"%>
</html>
