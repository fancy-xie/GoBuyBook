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
    <title>修改密码 - Go购书</title>

    <script src="js/modPwd.js"></script>

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

        #hint {
            position: fixed;
            top: 260px;
            left: 50%;
            margin-left: -51px;
            z-index: 10000;
            display: none;
        }
    </style>
</head>
<%@include file="head.jsp" %>
<body>
<div id="shop_body">
    <h3 class="title">修改密码</h3>
    <form action="userModifyPasswordServlet" method="post">
        <table class="table table-striped table-bordered">
            <tr>
                <td>
                    <b>旧的密码</b>
                </td>
                <td>
                    <input type="password" id="old_password" class="form-control col-lg-7" placeholder="请输入旧密码" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>新的密码</b>
                </td>
                <td>
                    <input type="password" id="password1" class="form-control" placeholder="请输入新密码" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>确认密码</b>
                </td>
                <td>
                    <input type="password" class="form-control" id="password2" placeholder="请再输入一次新密码" required/>
                    <span id="s_password" class="help-block"></span>
                </td>
            </tr>
        </table>
        <div class="form-group info-button">
            <input class="btn btn btn-default" type="button" value="返 回" onclick="location.href='userInfo.jsp'">&nbsp;
            <input class="btn btn btn-primary" type="button" id="submit_button" value="提 交">
        </div>
    </form>
</div>
<span id="hint" class="alert alert-success" role="alert"></span>
</body>
<%@include file="footer.jsp"%>
</html>
