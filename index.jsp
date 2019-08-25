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
    <script src="js/buy.js"></script>
    <title>Go购书 - 程序员最爱的购书网站</title>

    <style>
        #shop_body {
            width: 1200px;
            margin: 35px auto 60px;
        }

        #shop_body .title {
            width: 100%;
            margin: 30px 0;
            background: #5d5f72;
            padding: 10px;
            color: white;
        }

        #shop_body .under {
            clear: both;
        }

        .list-group {
            float: left;
        }

        #carousel-generic {
            width: 796px;
            float: left;
        }
    </style>

</head>
<%@include file="head.jsp" %>
<body>
<div id="shop_body">
    <h4 class="title">图书分类</h4>
    <div class="top">
        <div class="list-group col-md-4">
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">程序设计</h4>
                <p class="list-group-item-text">Java / Go / C语言 / C++ / 算法 / Python / PHP</p>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">移动开发</h4>
                <p class="list-group-item-text">Android / KotlinIOS / Obj-C / Swift / 微信小程序开发</p>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">人工智能</h4>
                <p class="list-group-item-text">深度学习与神经网络 / 机器学习 / TensorFlow</p>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">操作系统 / 系统开发</h4>
                <p class="list-group-item-text">LINUX / 系统开发 / WINDOWS / UNIX / Solaris</p>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">网络与数据通信</h4>
                <p class="list-group-item-text">网络配置与管理 / 电子商务 / 网络协议 / 通信 / 蓝牙技术</p>
            </a>
        </div>

        <div id="carousel-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-generic" data-slide-to="1"></li>
                <li data-target="#carousel-generic" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="image/s1.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="image/s2.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="image/s3.jpg" alt="...">
                </div>
            </div>
        </div>
    </div>

    <div class="under">
        <h4 class="title">热门排行</h4>
        <div class="row">
            <a href="javascript:void(0)" onclick="bookInfo(9)">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/xdczxt.jpg" alt="...">
                        <div class="caption">
                            <h5>现代操作系统（原书第4版）</h5>
                            <h6 title="Andrew S. Tanenbaum，Herbert Bos 著，陈向群 译">Andrew S. Tanenbaum，Herbert Bos 著，陈...</h6>
                            <p>￥79.00</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="bookInfo(11)">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/linuxsfc.jpg" alt="...">
                        <div class="caption">
                            <h5 title="鸟哥的Linux私房菜 基础学习篇 第四版">鸟哥的Linux私房菜 基础学习篇 第...</h5>
                            <h6>鸟哥 著</h6>
                            <p>￥96.40</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="bookInfo(10)">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/byyl.jpg" alt="...">
                        <div class="caption">
                            <h5>编译原理第2版</h5>
                            <h6>[美] 阿霍等著，赵建华等译 著</h6>
                            <p>￥70.30</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="bookInfo(8)">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/sdxx.jpg" alt="...">
                        <div class="caption">
                            <h5 title="深度学习 [deep learning]">深度学习 [deep learning]</h5>
                            <h6 title="[美] Ian，Goodfellow，[加] Yoshua，Bengio，[加] Aaron ... 著">[美] Ian，Goodfellow，[加] Yoshua，Beng...</h6>
                            <p>￥146.20</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="bookInfo(3)">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/srljjavaxnj.jpg" alt="...">
                        <div class="caption">
                            <h5 title="深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）">深入理解Java虚拟机：JVM高级特性...</h5>
                            <h6>周志明 著</h6>
                            <p>￥72.70</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="bookInfo(6)">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/redisshizhan.jpg" alt="...">
                        <div class="caption">
                            <h5>Redis实战</h5>
                            <h6 title="[美] 约西亚 L.卡尔森（Josiah，L.，Carlson） 著，黄健宏 译">[美] 约西亚 L.卡尔森（Josiah，L.，Carl...</h6>
                            <p>￥60.00</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="bookInfo(1)">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/chonggou.jpg" alt="...">
                        <div class="caption">
                            <h5>重构 改善既有代码的设计 第2版</h5>
                            <h6>[美]马丁·福勒（Martin Fowler）</h6>
                            <p>￥86.10</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="bookInfo(5})">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="image/book/srqcdocker.jpg" alt="...">
                        <div class="caption">
                            <h5>深入浅出Docker</h5>
                            <h6 title="Nigel，Poulton（奈吉尔·波尔顿） 著，李瑞丰，刘康 译">Nigel，Poulton（奈吉尔·波尔顿） 著，...</h6>
                            <p>￥60.00</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <hr>
        <div>
            <h4 class="title">猜你喜欢</h4>
            <div class="row">
                <a href="javascript:void(0)" onclick="bookInfo(7)">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="image/book/srljjsjxt.jpg" alt="...">
                            <div class="caption">
                                <h5>深入理解计算机系统...</h5>
                                <h6 title="[美] 兰德尔 E.布莱恩特（Randal E.·Bryant） 著，龚奕利，贺莲 译">[美] 兰德尔 E.布莱恩特...</h6>
                                <p>￥127.90</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="javascript:void(0)" onclick="bookInfo(4)">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="image/book/dmzjzd.jpg" alt="...">
                            <div class="caption">
                                <h5>代码整洁之道</h5>
                                <h6>[美] 马丁 著，韩磊 译</h6>
                                <p>￥51.30</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="javascript:void(0)" onclick="bookInfo(2)">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="image/book/suanfadaolun.jpg" alt="...">
                            <div class="caption">
                                <h5 title="算法导论（原书第3版）">算法导论（原书第...</h5>
                                <h6 title="[美] Thomas H.Cormen，[美] Charles E.Leiserson，[美] Ronald L.Rivest，[美] Clifford Stein 著，殷建平，徐云，王刚 等 译">[美] Thomas H.Corm...</h6>
                                <p>￥117.80</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="javascript:void(0)" onclick="bookInfo(1)">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="image/book/chonggou.jpg" alt="...">
                            <div class="caption">
                                <h5 title="重构 改善既有代码的设计 第2版">重构 改善既有代码的...</h5>
                                <h6 title="[美]马丁·福勒（Martin Fowler）">[美]马丁·福勒（Martin...</h6>
                                <p>￥86.10</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="javascript:void(0)" onclick="bookInfo(3)">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="image/book/srljjavaxnj.jpg" alt="...">
                            <div class="caption">
                                <h5 title="深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）">深入理解Java虚拟机...</h5>
                                <h6>周志明 著</h6>
                                <p>￥72.70</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="javascript:void(0)" onclick="bookInfo(10)">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="image/book/byyl.jpg" alt="...">
                            <div class="caption">
                                <h5>编译原理第2版</h5>
                                <h6 title="[美] 阿霍等著，赵建华等译 著">[美] 阿霍等著，赵建华等...</h6>
                                <p>￥70.30</p>
                            </div>
                        </div>
                    </div>
                </a>

            </div>
        </div>
    </div>
</div>

</body>
<%@include file="footer.jsp" %>
</html>
