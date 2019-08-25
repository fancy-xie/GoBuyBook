<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta username="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>确认订单 - GO购书</title>

    <style>
        #shop_body {
            width: 1200px;
            margin: 35px auto 120px;
        }

        #shop_body .title {
            margin: 30px 10px;
            color: rgba(85, 85, 85, 0.8);
        }

        .table tbody tr td {
            vertical-align: middle;
        }

        #under_table_button_right {
            float: right;
        }

        #sum_price {
            color: coral;
            font-size: 1.6em;
            float: right;
        }

        #order_info .short {
            width: 600px;
        }
    </style>
</head>
<%@include file="head.jsp" %>
<body>
<div id="shop_body">
    <h3 class="title">确认订单</h3>
    <table class="table table-striped table-bordered">
        <tr align="center" valign="middle">
            <th>商品信息</th>
            <th>单价</th>
            <th>数量</th>
            <th>金额</th>
        </tr>
        <c:forEach items="${cartItemList}" var="cartItem" varStatus="s">
            <tr>
                <td width="400px"><img src="image/book/${cartItem.getImgPath()}" alt="" width="100px">
                    <c:if test="${fn:length(cartItem.getBookName()) >= 24}">
                        <span title="${cartItem.getBookName()}">${fn:substring(cartItem.getBookName(), 0, 24)}...</span>
                    </c:if>
                    <c:if test="${fn:length(cartItem.getBookName()) < 24}">
                        <spank title="${cartItem.getBookName()}">${cartItem.getBookName()}</spank>
                    </c:if>
                </td>
                <td width="200px" class="price"><fmt:formatNumber value="${cartItem.getPrice()}"
                                                                  type="currency"/></td>
                <td width="80px">${cartItem.getQuantity()}</td>
                <td width="200px" class="sumBookPrice"><fmt:formatNumber
                        value="${cartItem.getQuantity() * cartItem.getPrice()}"
                        type="currency"/></td>
            </tr>
        </c:forEach>
    </table>
    <div id="sum_price"></div>
    <form method="post" action="submitOrderServlet" id="order_info">
        <table class="table table-striped table-bordered">
            <tr>
                <td>
                    <div class="form-group short">
                        <label>收货人：</label>
                        <input type="text" name="name" placeholder="收货人" value="${user.getTrueName()}"
                               class="form-control" required>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group short">
                        <label>手机号：</label>
                        <input type="text" name="phone" placeholder="手机号" value="${user.getPhone()}"
                               class="form-control" required>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group short">
                        <label>城市：</label>
                        <input type="text" name="city" placeholder="城市" value="${user.getCity()}"
                               class="form-control" required>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group">
                        <label>地址：</label>
                        <input type="text" name="address" placeholder="地址" value="${user.getAddress()}"
                               class="form-control" required>
                    </div>

                    <input type="text" name="sumPrice" value="" id="sum_price_input" hidden>
                </td>
            </tr>
        </table>
        <div id="under_table_button_right">
            &nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-default" onclick="location.href='/cartServlet'">返回购物车</button>&nbsp;
            <button type="submit" class="btn btn-primary">提交订单</button>
        </div>
    </form>
</div>
</body>
<script src="js/buy.js"></script>
<%@include file="footer.jsp" %>
</html>
