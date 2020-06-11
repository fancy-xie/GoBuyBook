package cn.xxf.web;

import cn.xxf.domain.User;
import cn.xxf.service.BookService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 将商品添加到购物车，
 * 并将信息通过json格式反馈给AJAX
 */
@WebServlet("/addToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String bookId = request.getParameter("bookId");
        String userId = request.getParameter("userId");

        //设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        Map<String, Object> map = new HashMap<String, Object>();

        BookService service = new BookService();

        if (service.addToCart(bookId, userId)) {
            //添加到购物车成功
            map.put("addSuccess", true);
            map.put("msg", "已添加到购物车。");
        } else {
            //添加失败
            map.put("addSuccess", false);
            map.put("msg", "添加购物车失败！");
        }

        //将map转为json
        ObjectMapper mapper = new ObjectMapper();
        //传递给客户端
        mapper.writeValue(response.getWriter(), map);
    }
}
