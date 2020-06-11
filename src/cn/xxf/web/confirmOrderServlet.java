package cn.xxf.web;

import cn.xxf.domain.CartItem;
import cn.xxf.domain.User;
import cn.xxf.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 确认订单
 */
@WebServlet("/confirmOrderServlet")
public class confirmOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //身份验证
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        int userId = user.getId();

        BookService service = new BookService();

        List<CartItem> cartItemList = service.cartList(userId); //加载购物车项

        request.setAttribute("cartItemList", cartItemList);
        request.getRequestDispatcher("/confirmOrder.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
