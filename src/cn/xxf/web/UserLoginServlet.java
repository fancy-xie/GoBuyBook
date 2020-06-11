package cn.xxf.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import cn.xxf.service.UserService;
import cn.xxf.domain.User;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * 用户登录
 */
@WebServlet("/userLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        //获取数据
        HttpSession session = request.getSession();

        Map<String, String[]> map = request.getParameterMap();
        //封装User对象
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //调用Service查询
        UserService service = new UserService();
        User loginUser = service.login(user);

        //判断是否登录成功
        if (loginUser != null) {
            //登录成功,将用户存入session
            session.setAttribute("user", loginUser);
            session.setMaxInactiveInterval(1800);   //半小时后失效
            //跳转页面
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            //登录失败
            //提示信息
            request.setAttribute("login_msg", "用户名或密码错误！");
            //跳转登录页面
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
