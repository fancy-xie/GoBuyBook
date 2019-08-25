sumPrice();

//计算总价
function sumPrice() {
    var sum_price = $('#sum_price')[0];
    var sum_book_price = $('.sumBookPrice');
    var temp = 0.00;
    for (var i = 0; i < sum_book_price.length; i++) {
        temp = temp + parseFloat(sum_book_price[i].innerText.slice(1));
    }
    sum_price.innerText = "￥" + temp.toFixed(2);
    $("#sum_price_input").val(temp.toFixed(2));
}

//添加到购物车
function addToCart(bookId, userId) {
    if (userId != null) {
        //发送ajax请求
        $.ajax({
            url: "/addToCartServlet",
            type: "post",
            data: {bookId: bookId, userId: userId},
            success: function (data) {
                var hint = $("#hint");
                //判断是否添加成功
                if (data.addSuccess) {
                    hint.fadeIn();
                    hint.removeClass("alert-danger");
                    hint.addClass("alert-success");
                    hint.html(data.msg);
                    hint.delay(2000).fadeOut();
                } else {
                    hint.fadeIn();
                    hint.removeClass("alert-success");
                    hint.addClass("alert-danger");
                    hint.html(data.msg);
                    hint.delay(2000).fadeOut();
                }
            }
        })
    } else {
        var hint = $("#hint");
        hint.fadeIn();
        hint.removeClass("alert-success");
        hint.removeClass("alert-danger");
        hint.addClass("alert-warning");
        hint.html("请先登录！");
        hint.delay(2000).fadeOut();
    }
};

//跳转到购物车
function jumpToCart() {
    //通过在js中拼接form表单并自动提交的方式实现post
    var form = $("<form method='post'></form>");
    form.attr({"action": "/cartServlet"});
    $("html").append(form);
    form.submit();
}

//购物车数量输入框数量判断
function checkQuantity(obj) {
    var thisObj = obj;
    //删除非数字字符
    var value = thisObj.value.replace(/\D/g, '');
    //保持1-999
    if (Number(value) < 1) {
        value = 1;
    } else if (Number(value) > 999) {
        value = 999;
    }
    $(obj).val(value);
    sumPrice();
}

//修改总价
function modSumPrice(obj, amount) {
    var thisObj = $(obj);
    var price = thisObj.parent().parent().parent().prev('.price')[0].innerText.slice(1);
    var sum = amount * parseFloat(price);

    thisObj.parent().parent().parent().next('.sumBookPrice')[0].innerText = "￥" + sum.toFixed(2);

    sumPrice();
}

//数量加一
function plusQuantity(obj) {
    var thisObj = $(obj);
    var input = thisObj.parent().prev('input');
    var amount = parseInt(input.val());
    if (amount >= 999) {
        return;
    } else {
        input.val(amount + 1);
    }
    modSumPrice(obj, amount + 1);
};

//数量减一
function minusQuantity(obj) {
    var thisObj = $(obj);
    var input = thisObj.parent().next('input');
    var amount = parseInt(input.val());
    if (amount <= 1) {
        return;
    } else {
        input.val(amount - 1);
    }
    modSumPrice(obj, amount - 1);
};

//清空购物车
function clearCart() {
    if (confirm("确认清空购物车？")) {
        //通过在js中拼接form表单并自动提交的方式实现post
        var form = $("<form method='post'></form>");
        form.attr({"action": "/cartClearServlet"});
        $("html").append(form);
        form.submit();
    }
}

//删除购物车
function delCart(bookId) {
    if (confirm("确认删除？")) {
        location.href = '/cartDelServlet?bookId=' + bookId;
    }
}

//确认订单
function confirmOrder() {
    //通过在js中拼接form表单并自动提交的方式实现post
    var form = $("<form method='post'></form>");
    form.attr({"action": "/confirmOrderServlet"});
    $("html").append(form);
    form.submit();
}

//修改订单状态
function changeOrderState(orderId, state) {
    if (state == 3) {
        if (confirm("确认取消订单？")) {
            //通过在js中拼接form表单并自动提交的方式实现post
            var form = $("<form method='post'></form>");
            form.attr({"action": "/changeOrderStateServlet"});
            var input_order = $("<input name='orderId' hidden></input>");
            var input_state = $("<input name='state' hidden></input>");

            input_order.val(orderId);
            input_state.val(state);

            form.append(input_order);
            form.append(input_state);
            $("html").append(form);

            form.submit();
        }
    } else if (state == 2) {
        if (confirm("确认已收到货了吗？")) {
            //通过在js中拼接form表单并自动提交的方式实现post
            var form = $("<form method='post'></form>");
            form.attr({"action": "/changeOrderStateServlet"});
            var input_order = $("<input name='orderId' hidden></input>");
            var input_state = $("<input name='state' hidden></input>");

            input_order.val(orderId);
            input_state.val(state);

            form.append(input_order);
            form.append(input_state);
            $("html").append(form);

            form.submit();
        }
    }
}

//跳转到书籍详情页面
function bookInfo(bookId) {
    var form = $("<form method='get'></form>");
    form.attr({"action": "/userBookInfoServlet"});
    var input = $("<input name='bookId' hidden></input>");

    input.val(bookId);

    form.append(input);
    $("html").append(form);

    form.submit();
}


