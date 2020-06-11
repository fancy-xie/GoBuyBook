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
 * 所有书籍页面
 */
@WebServlet("/allBookServlet")
public class AllBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookService service = new BookService();
        //调用service从数据库中读取书籍
        List<Book> booksList = service.findAll();
        request.setAttribute("booksList",booksList);

        request.getRequestDispatcher("/allBook.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
