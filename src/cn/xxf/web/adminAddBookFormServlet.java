package cn.xxf.web;

import cn.xxf.domain.Book;
import cn.xxf.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用于管理员将书籍添加到数据库
 */
@WebServlet("/adminAddBookFormServlet")
public class adminAddBookFormServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //验证管理员身份
        Object admin = request.getSession().getAttribute("admin");
        if (admin == null) {
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
            return;
        }

        request.setCharacterEncoding("utf-8");

        String bookImagePath = request.getParameter("bookImagePath");
        String bookName = request.getParameter("bookName");
        String bookAuthor = request.getParameter("bookAuthor");
        String bookPrice = request.getParameter("bookPrice");
        String bookDescription = request.getParameter("bookDescription");

        //将填写的书籍信息构造一个Book对象
        Book book = new Book(0, bookName, bookAuthor, Double.parseDouble(bookPrice), bookDescription, bookImagePath);

        AdminService service = new AdminService();

        if (service.addBook(book)) {
            request.setAttribute("add_msg", "提交成功！");
        } else {
            //提示信息
            request.setAttribute("add_msg", "提交失败！");
        }

        request.getRequestDispatcher("./WEB-INF/admin/adminAddBook.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
