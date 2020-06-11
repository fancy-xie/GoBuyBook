package cn.xxf.web;

import cn.xxf.domain.Book;
import cn.xxf.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 用于管理员展示所有书籍界面，
 * 查询书籍库将所有书籍读取出来
 */
@WebServlet("/adminAllBookServlet")
public class AdminAllBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //验证管理员身份
        Object admin = request.getSession().getAttribute("admin");
        if (admin == null) {
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
            return;
        }


        //调用服务将所有书籍存进List中
        BookService service = new BookService();
        List<Book> booksList = service.findAll();

        request.setAttribute("booksList",booksList);

        request.getRequestDispatcher("./WEB-INF/admin/adminAllBook.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
