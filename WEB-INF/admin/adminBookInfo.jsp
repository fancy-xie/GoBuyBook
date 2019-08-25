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
    <title>${book.getName()} - Go购书</title>

    <style>
        #shop_body {
            width: 1200px;
            margin: 35px auto 60px;
        }

        .bookImg {
            margin: 25px 20px 100px 0;
        }
    </style>
</head>
<%@include file="adminhead.jsp" %>
<body>
<div id="shop_body">
    <div class="row">
        <div class="bookImg col-md-4">
                <span class="thumbnail">
                    <img src="image/book/${book.getImgPath()}" alt="...">
                </span>
        </div>
        <span class="caption">
            <h2>${book.getName()}</h2>
            <h5>${book.getAuthor()}</h5>
            <h2><fmt:formatNumber value="${book.getPrice()}" type="currency"/></h2>
            <p>${book.getDescription()}</p>
        </span>
    </div>
</div>
</body>
</html>
