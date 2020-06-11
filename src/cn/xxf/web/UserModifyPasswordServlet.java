package cn.xxf.web;

import cn.xxf.domain.User;
import cn.xxf.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户修改密码
 */
@WebServlet("/userModifyPasswordServlet")
public class UserModifyPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //身份验证
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        //设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        UserService service = new UserService();

        //调用service进行查询
        int result = service.modPassword(user, oldPassword, newPassword);

        switch (result) {
            case 0:
                map.put("isModSuccess", true);
                map.put("msg", "修改成功！");
                break;
            case 1:
                map.put("isModSuccess", false);
                map.put("msg", "密码错误！");
                break;
            default:
                map.put("isModSuccess", false);
                map.put("msg", "修改失败！");
        }

        //将map转为json
        ObjectMapper mapper = new ObjectMapper();
        //传递给客户端
        mapper.writeValue(response.getWriter(), map);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
