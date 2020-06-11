package cn.xxf.web;

import cn.xxf.domain.Admin;
import cn.xxf.service.AdminService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * 管理员登录验证
 */
@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        //获取数据
        HttpSession session = request.getSession();

        Map<String, String[]> map = request.getParameterMap();

        //封装对象
        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //调用Service查询
        AdminService service = new AdminService();
        Admin loginAdmin = service.login(admin);

        //判断是否登录成功
        if (loginAdmin != null) {
            //登录成功,存入session
            session.setAttribute("admin", loginAdmin);
            session.setMaxInactiveInterval(1800);   //半小时后失效
            //跳转页面
            request.getRequestDispatcher("/adminIndexServlet").forward(request, response);
        } else {
            //登录失败
            //提示信息
            request.setAttribute("login_msg", "用户名或密码错误！");
            //跳转登录页面
            request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
