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
 * 查看书的详细信息
 */
@WebServlet("/userBookInfoServlet")
public class UserBookInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookId = request.getParameter("bookId");

        BookService service = new BookService();
        Book book = service.findBook(Integer.valueOf(bookId));

        request.setAttribute("book", book);

        request.getRequestDispatcher("bookInfo.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
