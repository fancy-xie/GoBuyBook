package cn.xxf.web;

import cn.xxf.domain.User;
import cn.xxf.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户注册
 */
@WebServlet("/userRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取数据
        Map<String, String[]> map = request.getParameterMap();

        User user = new User();

        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //调用Service
        UserService service = new UserService();

        //判断是否注册成功
        if (service.register(user)) {
            //跳转页面
            response.setHeader("refresh", "3;url=login.jsp");
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("注册成功，页面将在3秒后跳转，如果没有，请点<a href='login.jsp'>登录</a>");
        } else {

            //注册失败
            //提示信息
            request.setAttribute("reg_msg", "请稍后再试！");
            //跳转注册页面
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    /**
     * 被用来检查注册时填写的用户名是否被占用
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        //设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        UserService service = new UserService();

        //调用service进行查询
        if (service.isUsernameExist(username)) {
            //存在
            map.put("isUserExist", true);
            map.put("msg", "此用户名已存在！");
        } else {
            //不存在
            map.put("isUserExist", false);
            map.put("msg", "用户名可用。");
        }

        //将map转为json
        ObjectMapper mapper = new ObjectMapper();
        //传递给客户端
        mapper.writeValue(response.getWriter(), map);

    }
}
