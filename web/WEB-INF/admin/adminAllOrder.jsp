<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>所有订单 - Go购书</title>

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

        .order-table {
            border: rgba(93, 95, 114, 0.16) solid 1px;
            border-radius: 4px;
            padding: 3px;
            margin-bottom: 100px;
        }
    </style>
</head>
<%@include file="adminhead.jsp"%>
<body>
<div id="shop_body">
    <h3 class="title">我的订单</h3>
    <c:forEach items="${orderMapList}" var="orderMap">
        <div class="order-table">
            <table class="table table-condensed table-bordered table-striped" align="center">
                <tr>
                    <th>订单ID</th>
                    <th>下单时间</th>
                    <th>总价</th>
                    <th>状态</th>
                    <c:if test="${orderMap.get(\"orderInfo\").getState() == 0}">
                        <th>操作</th>
                    </c:if>
                </tr>
                <tr>
                    <td>
                        <c:out value="${orderMap.get(\"orderInfo\").getId()}"/>
                    </td>
                    <td>
                        <c:out value="${orderMap.get(\"orderInfo\").getTime()}"/>
                    </td>
                    <td>
                        ￥<c:out value="${orderMap.get(\"orderInfo\").getPrice()}"/>
                    </td>
                    <td>
                        <c:if test="${orderMap.get(\"orderInfo\").getState() == 0}">
                            待发货
                        </c:if>
                        <c:if test="${orderMap.get(\"orderInfo\").getState() == 1}">
                            已发货
                        </c:if>
                        <c:if test="${orderMap.get(\"orderInfo\").getState() == 2}">
                            已收货
                        </c:if>
                        <c:if test="${orderMap.get(\"orderInfo\").getState() == 3}">
                            已取消
                        </c:if>
                    </td>
                    <c:if test="${orderMap.get(\"orderInfo\").getState() == 0}">
                        <td>
                            <input type="button" class="btn btn-danger" value="发 货"
                                   onclick="changeOrderState(
                                       ${orderMap.get("orderInfo").getId()}
                                           )">
                        </td>
                    </c:if>
                </tr>
            </table>
            <table class="table table-condensed table-bordered table-striped">
                <tr>
                    <th>用户ID</th>
                    <th>用户名</th>
                    <th>收货手机</th>
                    <th>收货地址</th>
                </tr>
                <tr>
                    <td>
                        <c:out value="${orderMap.get(\"user\").getId()}"/>
                    </td>
                    <td>
                        <c:out value="${orderMap.get(\"user\").getUsername()}"/>
                    </td>
                    <td>
                        <c:out value="${orderMap.get(\"orderInfo\").getPhone()}"/>
                    </td>
                    <td>
                        <c:out value="${orderMap.get(\"orderInfo\").getAddress()}"/>
                    </td>
                </tr>
            </table>
            <table class="table table-condensed table-bordered">
                <tr align="center" valign="middle">
                    <th>商品信息</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                </tr>
                <c:forEach items="${orderMap.get(\"orderItem\")}" var="orderItem">
                    <tr>
                        <td width="400px"><img src="image/book/${orderItem.getImgPath()}" alt=""
                                               width="100px">
                            <c:if test="${fn:length(orderItem.getBookName()) >= 24}">
                                <span title="${orderItem.getBookName()}">${fn:substring(orderItem.getBookName(), 0, 24)}...</span>
                            </c:if>
                            <c:if test="${fn:length(orderItem.getBookName()) < 24}">
                                <spank title="${orderItem.getBookName()}">${orderItem.getBookName()}</spank>
                            </c:if>
                        </td>
                        <td width="200px" class="price"><fmt:formatNumber value="${orderItem.getPrice()}"
                                                                          type="currency"/></td>
                        <td width="80px">${orderItem.getQuantity()}</td>
                        <td width="200px" class="sumBookPrice"><fmt:formatNumber
                                value="${orderItem.getQuantity() * orderItem.getPrice()}"
                                type="currency"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </c:forEach>
</div>
<script src="/js/admin.js"></script>
</body>
</html>
