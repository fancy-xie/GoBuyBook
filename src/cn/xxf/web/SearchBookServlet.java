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
 * 搜索书籍
 */
@WebServlet("/searchBookServlet")
public class SearchBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String searchContent = request.getParameter("search-content");  //获取搜索内容

        BookService service = new BookService();

        List<Book> searchBooks = service.search(searchContent); //将搜索内存存入List

        request.setAttribute("searchContent", searchContent);

        if (searchBooks != null) {
            request.setAttribute("searchBooks", searchBooks);

            Object admin = request.getSession().getAttribute("admin");  //判断当前管理员是否登录
            if (admin != null) {
                request.getRequestDispatcher("./WEB-INF/admin/adminSearchBook.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/searchBook.jsp").forward(request, response);
            }
        }
    }
}
