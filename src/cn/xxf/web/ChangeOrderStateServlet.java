package cn.xxf.web;

import cn.xxf.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户改变订单状态
 */
@WebServlet("/changeOrderStateServlet")
public class ChangeOrderStateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //验证身份
        Object user = request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String orderId = request.getParameter("orderId");   //订单ID
        String state = request.getParameter("state");   //将要修改成的状态

        BookService service = new BookService();
        service.changeOrderState(orderId, state);

        response.sendRedirect("/userAllOrderServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
