package cn.xxf.web;

import cn.xxf.domain.User;
import cn.xxf.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 提交订单
 */
@WebServlet("/submitOrderServlet")
public class SubmitOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //验证身份
        User user_session = (User) request.getSession().getAttribute("user");
        if (user_session == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        //获取提交的订单信息
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String sumPrice = request.getParameter("sumPrice");

        //将信息构造User对象
        User user = new User(user_session.getId(), user_session.getUsername(), user_session.getPassword(), name, phone, city, address);

        BookService service = new BookService();

        //返回提交状态
        if (service.addOrder(user, sumPrice)) {
            request.setAttribute("order_msg", true);
        } else {
            request.setAttribute("order_msg", false);
        }

        request.getRequestDispatcher("/OrderSuccess.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
