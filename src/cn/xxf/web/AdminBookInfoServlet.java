package cn.xxf.web;

import cn.xxf.domain.Book;
import cn.xxf.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 管理员查看书籍信息
 */

@WebServlet("/adminBookInfoServlet")
public class AdminBookInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //验证管理员身份
        Object admin = request.getSession().getAttribute("admin");
        if (admin == null) {
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
            return;
        }

        String bookId = request.getParameter("bookId");

        BookService service = new BookService();
        Book book = service.findBook(Integer.valueOf(bookId));

        request.setAttribute("book", book);

        request.getRequestDispatcher("./WEB-INF/admin/adminBookInfo.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
