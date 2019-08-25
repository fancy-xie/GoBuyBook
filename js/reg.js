//绑定事件
$(function () {
    //提示框关闭按钮
    $(".close").click(function () {
        $("#alert").alert();
    });

    //给username绑定blur事件
    $("#username").blur(function () {
        //获取username文本输入框的值
        var username = $(this).val();
        if (username != "") {
            //发送ajax请求
            $.ajax({
                url: "userRegisterServlet",
                type: "get",
                data: {username: username},
                success: function (data) {
                    var span = $("#s_username");
                    var usernameForm = $("#username").parent();
                    var reg = $("#regButton");
                    //判断userExsit键的值是否是true
                    if (data.isUserExist) {
                        //用户名存在
                        usernameForm.removeClass("has-success");
                        usernameForm.addClass("has-error");
                        span.html(data.msg);

                        reg.attr("disabled", true);
                    } else {
                        //用户名不存在
                        usernameForm.removeClass("has-error")
                        usernameForm.addClass("has-success");
                        span.html(data.msg);
                        reg.attr("disabled", false);
                    }
                }
            });
        }
    });

    //判断密码是否一致
    $("#password1").keyup(function () {
        var pwd1value = $("#password1").val();
        var pwd2value = $("#password2").val();
        var span = $("#s_password");
        var password1Form = $("#password1").parent();
        var password2Form = $("#password2").parent();
        var reg = $("#regButton");

        if (pwd1value != pwd2value) {
            //两次密码不同
            password1Form.removeClass("has-success");
            password1Form.addClass("has-error");
            password2Form.removeClass("has-success");
            password2Form.addClass("has-error");
            span.html("两次密码输入不相同！");
            reg.attr("disabled", true);
        } else {
            password1Form.removeClass("has-error")
            password1Form.addClass("has-success");
            password2Form.removeClass("has-error")
            password2Form.addClass("has-success");
            span.html("");
            reg.attr("disabled", false);
        }
    });

    $("#password2").keyup(function () {
        var pwd1value = $("#password1").val();
        var pwd2value = $("#password2").val();
        var span = $("#s_password");
        var password1Form = $("#password1").parent();
        var password2Form = $("#password2").parent();
        var reg = $("#regButton");

        if (pwd1value != pwd2value) {
            //两次密码不同
            password1Form.removeClass("has-success");
            password1Form.addClass("has-error");
            password2Form.removeClass("has-success");
            password2Form.addClass("has-error");
            span.html("两次密码输入不相同！");
            reg.attr("disabled", true);
        } else {
            password1Form.removeClass("has-error")
            password1Form.addClass("has-success");
            password2Form.removeClass("has-error")
            password2Form.addClass("has-success");
            span.html("");
            reg.attr("disabled", false);
        }
    });
});