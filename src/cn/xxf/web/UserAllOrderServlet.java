package cn.xxf.web;

import cn.xxf.domain.CartItem;
import cn.xxf.domain.Order;
import cn.xxf.domain.User;
import cn.xxf.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * 用户所有订单
 */
@WebServlet("/userAllOrderServlet")
public class UserAllOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //身份验证
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        int userId = user.getId();

        BookService service = new BookService();
        List<Order> orderList = service.userAllOrder(userId);   //所有订单
        List<Map<String, Object>> orderMapList = new ArrayList<>(); //所有订单和所有订单内容

        Iterator<Order> iter = orderList.iterator();
        while (iter.hasNext()) {
            Order order = iter.next();
            Map<String, Object> map = new HashMap<String, Object>();

            List<CartItem> orderItemList = service.userOrderItem(order.getId());    //订单中的项

            map.put("orderInfo", order);    //订单信息
            map.put("orderItem", orderItemList);    //订单中的项

            orderMapList.add(map);  //保存到List中
        }

        Collections.reverse(orderMapList);  //将顺序翻转，按订单号从大到小排列

        request.setAttribute("orderMapList",orderMapList);
        request.getRequestDispatcher("/userAllOrder.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
