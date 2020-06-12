<%--
    商城页头
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta username="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/buy.js"></script>


    <style>
        #shop_head {
            padding: 20px 0;
            background: #5d5f72;
            height: 150px;
            text-align: center;
            color: rgb(177, 210, 190);
        }

        #head_nav {
            box-shadow: #cecece 0px 3px 5px
        }

        .fixed {
            position: fixed;
            top: 0;
            z-index: 10000;
            width: 100%;
        }

        .table tbody tr td{
            vertical-align: middle;
        }
    </style>
    <script>
        $(document).ready(function () {
            var navOffset = $("#head_nav").offset().top;
            $(window).scroll(function () {
                var scrollPos = $(window).scrollTop();
                if (scrollPos >= navOffset) {
                    $("#head_nav").addClass("fixed");
                    $("#head_nav").css("position", "fixed");
                } else {
                    $("#head_nav").removeClass("fixed");
                    $("#head_nav").css("position", "relative");
                }
            });
        });
    </script>
</head>

<body>
<div id="shop_head">
    <img src="image/logo.png" alt="logo" width="180px">
</div>

<nav id="head_nav" class="navbar navbar-default" style="padding: 0 50px;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
                <img alt="Brand" src="image/logo.png" width="35px">
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${fn:endsWith(pageContext.request.getRequestURL(), 'index.jsp')}">
                        <li class="active"><a href="${pageContext.request.contextPath}/index.jsp"><span
                                class="glyphicon glyphicon-home"
                                aria-hidden="true"></span> 首页</a>
                        </li>
                        <li><a href="/allBookServlet"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>
                            所有书籍</a>
                        </li>
                    </c:when>
                    <c:when test="${fn:endsWith(pageContext.request.getRequestURL(), 'allBook.jsp')}">
                        <li><a href="${pageContext.request.contextPath}/index.jsp"><span
                                class="glyphicon glyphicon-home"
                                aria-hidden="true"></span> 首页</a>
                        </li>
                        <li class="active"><a href="/allBookServlet"><span class="glyphicon glyphicon-book"
                                                                           aria-hidden="true"></span> 所有书籍</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/index.jsp"><span
                                class="glyphicon glyphicon-home"
                                aria-hidden="true"></span> 首页</a>
                        </li>
                        <li><a href="/allBookServlet"><span class="glyphicon glyphicon-book"
                                                            aria-hidden="true"></span> 所有书籍</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <form action="searchBookServlet" method="get" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" name="search-content" class="form-control" placeholder="输入书籍或作者" required>
                </div>
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"
                                                                    aria-hidden="true"></span> 搜索
                </button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${user != null}">
                    <li><a href="javascript:void(0)" onclick="jumpToCart();"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 购物车</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"><span class="glyphicon glyphicon-user"
                                                       aria-hidden="true"></span> ${user.getUsername()} <span
                                class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/userAllOrderServlet"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                                我的订单</a></li>
                            <li><a href="${pageContext.request.contextPath}/userInfo.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                                个人信息</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/userOutServlet"><span
                                    class="glyphicon glyphicon-log-out" aria-hidden="true"></span> 注销</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${user == null}">
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> 请登录</a>
                    </li>
                    <li><a href="register.jsp"><span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                        注册</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
</body>

</html>
