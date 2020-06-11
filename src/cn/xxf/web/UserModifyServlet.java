package cn.xxf.web;

import cn.xxf.domain.User;
import cn.xxf.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 用户修改信息
 */
@WebServlet("/userModifyServlet")
public class UserModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //身份验证
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        //获取提交的信息
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String address = request.getParameter("address");

        //保存到对象
        user.setTrueName(name);
        user.setPhone(phone);
        user.setCity(city);
        user.setAddress(address);

        //调用service修改
        UserService service = new UserService();
        service.modInfo(user);

        //重新保存session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setMaxInactiveInterval(1800);   //半小时后失效

        response.sendRedirect(request.getContextPath() + "/userInfo.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
