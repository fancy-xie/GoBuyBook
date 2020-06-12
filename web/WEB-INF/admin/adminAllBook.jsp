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
    <title>所有书籍 - Go购书</title>
    <script src="js/admin.js"></script>

    <style>
        #shop_body {
            width: 1200px;
            margin: 35px auto 60px;
        }

        #shop_body .title {
            margin: 30px 10px;
            color: rgba(85, 85, 85, 0.8);
        }

        #hint {
            position: fixed;
            top: 240px;
            left: 50%;
            margin-left: -60px;
            z-index: 10000;
            display: none;
        }
    </style>
</head>
<%@include file="adminhead.jsp" %>
<body>
<div id="shop_body">
    <div>
        <h3 class="title">所有书籍</h3>
        <div class="row">
            <c:forEach items="${booksList}" var="book">
                <a href="javascript:void(0)" onclick="bookInfo(${book.getId()})">
                    <div class="col-sm-6 col-md-3">
                        <div class="thumbnail">
                            <img src="image/book/${book.getImgPath()}" alt="...">
                            <div class="caption">
                                <c:if test="${fn:length(book.getName()) >= 18}">
                                    <h5 title="${book.getName()}">${fn:substring(book.getName(), 0, 18)}...</h5>
                                </c:if>
                                <c:if test="${fn:length(book.getName()) < 18}">
                                    <h5 title="${book.getName()}">${book.getName()}</h5>
                                </c:if>
                                <c:if test="${fn:length(book.getAuthor()) >= 24}">
                                    <h6 title="${book.getAuthor()}">${fn:substring(book.getAuthor(), 0, 24)}...</h6>
                                </c:if>
                                <c:if test="${fn:length(book.getAuthor()) < 24}">
                                    <h6 title="${book.getAuthor()}">${book.getAuthor()}</h6>
                                </c:if>
                                <p><fmt:formatNumber value="${book.getPrice()}" type="currency"/></p>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<span id="hint" class="alert alert-success" role="alert"></span>
</body>
</html>
