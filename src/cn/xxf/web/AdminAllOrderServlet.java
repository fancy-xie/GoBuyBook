package cn.xxf.web;

import cn.xxf.domain.Admin;
import cn.xxf.domain.CartItem;
import cn.xxf.domain.Order;
import cn.xxf.domain.User;
import cn.xxf.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * 用于管理员列出所有订单项
 */
@WebServlet("/adminAllOrderServlet")
public class AdminAllOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //验证管理员身份
        Object admin = request.getSession().getAttribute("admin");
        if (admin == null) {
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
            return;
        }

        AdminService service = new AdminService();
        List<Order> orderList = service.AllOrder();   //所有订单
        List<Map<String, Object>> orderMapList = new ArrayList<>(); //所有订单和所有订单内容

        Iterator<Order> iter = orderList.iterator();
        while (iter.hasNext()) {
            Order order = iter.next();
            Map<String, Object> map = new HashMap<String, Object>();
            User user = service.orderUser(order.getUserId());   //通过用户ID来查找用户信息
            List<CartItem> orderItemList = service.orderItem(order.getId());    //订单中的项

            map.put("orderInfo", order);    //订单信息
            map.put("user", user);  //订单用户信息
            map.put("orderItem", orderItemList);    //订单中的项

            orderMapList.add(map);  //保存到List中
        }

        Collections.reverse(orderMapList);  //将顺序翻转，按订单号从大到小排列

        request.setAttribute("orderMapList",orderMapList);
        request.getRequestDispatcher("./WEB-INF/admin/adminAllOrder.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
