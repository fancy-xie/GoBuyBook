package cn.xxf.web;

import cn.xxf.domain.User;
import cn.xxf.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/**
 * 用户保存购物车状态（修改购物车项数量）
 */
@WebServlet("/cartSaveServlet")
public class CartSaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //身份验证
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        int userId = user.getId();

        BookService service = new BookService();
        Map<String, String[]> map = request.getParameterMap();

        //遍历
        for (Iterator iter = map.entrySet().iterator(); iter.hasNext(); ) {
            Map.Entry element = (Map.Entry) iter.next();

            String bookId = element.getKey().toString();
            String quantity = ((String[]) element.getValue())[0];


            service.modQuantity(quantity, bookId, userId);  //修改购物车项数量
        }
        response.sendRedirect("/cartServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
