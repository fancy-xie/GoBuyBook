<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta username="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>提交订单 - Go购书</title>
    <style>
        #shop_body {
            width: 1200px;
            margin: 35px auto 120px;
        }

        #shop_body .title {
            margin: 30px 10px;
            color: rgba(85, 85, 85, 0.8);
        }
    </style>
</head>
<%@include file="head.jsp" %>
<body>
<div id="shop_body">
    <c:if test="${order_msg == true}">
        <h3 class="title">提交成功</h3>
        <div class="alert alert-success" role="alert">订单提交成功，耐心等待发货吧。</div>
    </c:if>
    <c:if test="${order_msg == false}">
        <h3 class="title">提交失败</h3>
        <div class="alert alert-warning" role="alert">订单提交失败，请稍后再试。</div>
    </c:if>
</div>
</body>
<%@include file="footer.jsp" %>
</html>
