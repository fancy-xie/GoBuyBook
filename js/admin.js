//修改订单状态
function changeOrderState(orderId, state) {
    if (confirm("确认发货？")) {
        //通过在js中拼接form表单并自动提交的方式实现post
        var form = $("<form method='post'></form>");
        form.attr({"action": "/adminDeliveryServlet"});
        var input_order = $("<input name='orderId' hidden></input>");

        input_order.val(orderId);

        form.append(input_order);
        $("html").append(form);

        form.submit();
    }

}

//上传图片
function uploadImage() {
    var form = $("#book_image_form")[0];
    var fd = new FormData(form);

    $.ajax({
        url: "/adminAddBookUploadServlet",
        type: "post",
        data: fd,
        processData: false,
        contentType: false,
        success: function (data) {
            console.log("over..");

            var span = $("#s_image");

            if (data.msg == "") {
                span.html("上传成功。");
            } else {
                span.html(data.msg);
            }
        },
        error: function (e) {
            var span = $("#s_image");
            span.html("错误！");
        }
    });
}

//提交书籍信息表单
function submitForm() {
    var form = $("#book_info_form")[0];
    var str = $("#book_image")[0].value.split("\\")[2];

    var input = $("#book_image_path");
    input.val(str);

    form.submit();
}

//跳转到书籍信息页面
function bookInfo(bookId) {
    var form = $("<form method='get'></form>");
    form.attr({"action": "/adminBookInfoServlet"});
    var input = $("<input name='bookId' hidden></input>");

    input.val(bookId);

    form.append(input);
    $("html").append(form);

    form.submit();
}