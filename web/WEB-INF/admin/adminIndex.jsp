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
    <title>管理员 - Go购书</title>
    <style>
        #shop_body {
            width: 1000px;
            margin: 35px auto 60px;
        }
    </style>

</head>
<%@include file="adminhead.jsp" %>
<body>
<div class="jumbotron">
    <div id="shop_body">
        <h1>你好，${admin.getUsername()}</h1>
        <p>欢迎进入管理员后台，快来看看又新增了哪些新订单吧。</p>
        <p><a class="btn btn-primary btn-lg" href="adminAllOrderServlet" role="button">查看订单</a></p>
    </div>
</div>
</body>
</html>
