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


    <title>购物车 - Go购书</title>
    <style>
        #shop_body {
            width: 1200px;
            margin: 35px auto 160px;
        }

        #shop_body .title {
            margin: 30px 10px;
            color: rgba(85, 85, 85, 0.8);
        }

        .table tbody tr td {
            vertical-align: middle;
        }

        #hint {
            position: fixed;
            top: 60px;
            left: 50px;
            z-index: 10000;
            display: none;
        }

        #under_table_button_left {
            float: left;
        }

        #under_table_button_right {
            float: right;
        }

        td input {
            text-align: center;
        }

        #sum_price {
            color: coral;
            font-size: 1.6em;
        }
    </style>
</head>
<%@include file="head.jsp" %>
<body>
<div id="shop_body">
    <h3 class="title">购物车</h3>
    <c:if test="${!cartItemList.isEmpty()}">
        <form action="cartSaveServlet" method="post">
            <table class="table table-striped table-bordered">
                <tr align="center" valign="middle">
                    <th>商品信息</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${cartItemList}" var="cartItem" varStatus="s">
                    <tr>
                        <td width="400px"><img src="image/book/${cartItem.getImgPath()}" alt="" width="100px">
                            <c:if test="${fn:length(cartItem.getBookName()) >= 22}">
                                <span title="${cartItem.getBookName()}">${fn:substring(cartItem.getBookName(), 0, 22)}...</span>
                            </c:if>
                            <c:if test="${fn:length(cartItem.getBookName()) < 22}">
                                <spank title="${cartItem.getBookName()}">${cartItem.getBookName()}</spank>
                            </c:if>
                        </td>
                        <td width="200px" class="price"><fmt:formatNumber value="${cartItem.getPrice()}"
                                                                          type="currency"/></td>
                        <td width="80px">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"
                                            onclick="minusQuantity(this)">&nbsp;<span
                                            class="glyphicon glyphicon-minus"></span></button>
                                </span>
                                <input username="${cartItem.getBookId()}" type="text" class="form-control"
                                       placeholder="数量" onkeyup="checkQuantity(this)"
                                       value="${cartItem.getQuantity()}" required>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" onclick="plusQuantity(this)"><span
                                            class="glyphicon glyphicon-plus"></span>&nbsp;</button>
                                </span>
                            </div>
                        </td>
                        <td width="200px" class="sumBookPrice"><fmt:formatNumber
                                value="${cartItem.getQuantity() * cartItem.getPrice()}"
                                type="currency"/></td>
                        <td width="50px">
                            <button type="button" class="btn btn-default" onclick="delCart(${cartItem.getBookId()})">删 除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <div id="under_table_button_left">
                <button type="button" class="btn btn-default" onclick="clearCart()">清空购物车</button>
            </div>
            <div id="under_table_button_right">
                <span id="sum_price"></span>&nbsp;&nbsp;&nbsp;
                <button type="submit" class="btn btn-default">保存修改</button>&nbsp;
                <button type="button" class="btn btn-primary" onclick="confirmOrder()">结 算</button>
            </div>
        </form>
    </c:if>
    <c:if test="${cartItemList.isEmpty()}">
        <div class="alert alert-info" role="alert">您的购物车还是空的，快去挑书吧！</div>
    </c:if>
</div>
<span id="hint" class="alert alert-success" role="alert"></span>
</body>
<script src="js/buy.js"></script>
<%@include file="footer.jsp" %>
</html>
