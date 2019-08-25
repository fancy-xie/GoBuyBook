<%--
    商城页脚
--%>
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

    <style>
        #footer {
            padding: 40px 0 20px;
            background: #5d5f72;
            color: white;
            text-align: center;
        }

        #footer a {
            color: white;
        }

        .footer-top {
            width: 600px;
            margin: 0 auto 20px;
        }

        .footer-hr {
            width: 600px;
            color: #5d5f72;
        }

        .footer-bottom {
            color: #b6b6b6;
        }

        .table tbody tr td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div id="footer">
<div class="container">
        <div class="row footer-top">
            <div class="row about">
                <div class="col-xs-3">
                    <h4>关于</h4>
                    <ul class="list-unstyled">
                        <li>
                            <a href="">关于我们</a>
                        </li>
                        <li>
                            <a href="">诚招英才</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-3">
                    <h4>合作</h4>
                    <ul class="list-unstyled">
                        <li>
                            <a href="">商业推广</a>
                        </li>
                        <li>
                            <a href="">合作伙伴</a>
                        </li>
                    </ul>
                </div>

                <div class="col-xs-3">
                    <h4>联系方式</h4>
                    <ul class="list-unstyled">
                        <li>
                            <a href="">新浪微博</a>
                        </li>
                        <li>
                            <a href="">电子邮件</a>
                        </li>
                    </ul>
                </div>

                <div class="col-xs-3">
                    <h4>售后服务</h4>
                    <ul class="list-unstyled">
                        <li>
                            <a href="">联系客服</a>
                        </li>
                        <li>
                            <a href="">进度查询</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <hr class="footer-hr">
        <div class="row footer-bottom">
            <ul class="list-inline text-center">
                <li>Copyright &copy;2019&nbsp;&nbsp;GZHU&nbsp;&nbsp;Software All Rights Reserved.</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
