//jQ绑定事件
$(function () {
    //提示关闭按钮
    $(".close").click(function () {
        $("#alert").alert();
    });

    //检查密码是否一致
    $("#password1").keyup(function () {
        var pwd1value = $("#password1").val();
        var pwd2value = $("#password2").val();
        var span = $("#s_password");
        var password1Form = $("#password1").parent();
        var password2Form = $("#password2").parent();
        var mod = $("#submit_button");

        if (pwd1value != pwd2value) {
            //两次密码不同
            password1Form.removeClass("has-success");
            password1Form.addClass("has-error");
            password2Form.removeClass("has-success");
            password2Form.addClass("has-error");
            span.html("两次密码输入不相同！");
            mod.attr("disabled", true);
        } else {
            password1Form.removeClass("has-error")
            password1Form.addClass("has-success");
            password2Form.removeClass("has-error")
            password2Form.addClass("has-success");
            span.html("");
            mod.attr("disabled", false);
        }
    });

    $("#password2").keyup(function () {
        var pwd1value = $("#password1").val();
        var pwd2value = $("#password2").val();
        var span = $("#s_password");
        var password1Form = $("#password1").parent();
        var password2Form = $("#password2").parent();
        var mod = $("#submit_button");

        if (pwd1value != pwd2value) {
            //两次密码不同
            password1Form.removeClass("has-success");
            password1Form.addClass("has-error");
            password2Form.removeClass("has-success");
            password2Form.addClass("has-error");
            span.html("两次密码输入不相同！");
            mod.attr("disabled", true);
        } else {
            password1Form.removeClass("has-error")
            password1Form.addClass("has-success");
            password2Form.removeClass("has-error")
            password2Form.addClass("has-success");
            span.html("");
            mod.attr("disabled", false);
        }
    });

    //提交按钮
    $('#submit_button').click(function () {
        var oldPassword = $("#old_password").val();
        var newPassword = $("#password1").val();
        var hint = $("#hint");
        if (oldPassword == "" || newPassword == "") {
            hint.fadeIn();
            hint.removeClass("alert-success");
            hint.addClass("alert-danger");
            hint.html("输入为空！");
            hint.delay(2000).fadeOut();
            return;
        } else {
            $.ajax({
                url: "/userModifyPasswordServlet",
                type: "post",
                data: {oldPassword: oldPassword, newPassword: newPassword},
                success: function (data) {
                    console.log(data.isModSuccess);
                    //判断是否成功
                    if (data.isModSuccess) {
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
        }
    })
});