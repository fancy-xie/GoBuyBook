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

    <script src="/js/admin.js"></script>

    <title>添加书籍 - Go购书</title>
    <style>
        #shop_body {
            width: 800px;
            margin: 35px auto 60px;
        }

        #shop_body .title {
            margin: 30px 10px;
            color: rgba(85, 85, 85, 0.8);
        }
    </style>
</head>
<%@include file="adminhead.jsp" %>
<body>
<div id="shop_body">
    <h3 class="title">添加书籍</h3>

    <form id="book_image_form">
        <div class="form-group">
            <label for="book_image">书籍图片</label>
            <input type="file" name="bookImage" id="book_image">
            <p class="help-block">请选择分辨率为“968*800”,大小不超过1M的图片。</p>
        </div>
        <button type="button" class="btn btn-primary" onclick="uploadImage()">上 传</button>
        <span id="s_image" class="help-block"></span>
    </form>

    <form method="post" action="/adminAddBookFormServlet" id="book_info_form">
        <div class="form-group">
            <label for="book_name">书名</label>
            <input type="text" class="form-control" name="bookName" id="book_name" placeholder="书名">
        </div>
        <div class="form-group">
            <label for="book_author">作者</label>
            <input type="text" class="form-control" name="bookAuthor" id="book_author" placeholder="作者">
        </div>
        <div class="form-group">
            <label for="book_price">价格</label>
            <input type="text" class="form-control" name="bookPrice" id="book_price" placeholder="价格">
        </div>
        <div class="form-group">
            <label for="book_description">描述</label>
            <textarea class="form-control" rows="5" name="bookDescription" id="book_description" placeholder="描述"></textarea>
        </div>
        <input name='bookImagePath' value="" id="book_image_path" hidden></input>
        <button type="button" class="btn btn-primary" onclick="submitForm()">提 交</button>
    </form>
    <!-- 出错显示的信息框 -->
    <div id="alert" class="alert alert-warning">
        <a class="close" data-dismiss="alert">&times;</a>
        <strong>${add_msg}</strong>
    </div>
</div>
</body>
<script>
    if ("${add_msg}" == "") {
        $('#alert').addClass("hide");
    }
</script>
</html>
