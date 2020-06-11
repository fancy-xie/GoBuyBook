package cn.xxf.dao;

import cn.xxf.domain.*;
import cn.xxf.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

/**
 * 管理员DAO
 */
public class AdminDao {
    //JDBC模板对象
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 通过用户名和密码查找管理员
     *
     * @param username
     * @param password
     * @return
     */
    public Admin findByNameAndPassword(String username, String password) {
        try {
            String sql = "select * from admin where username = ? and password = ?";
            List<Admin> admin = template.query(sql, new BeanPropertyRowMapper<Admin>(Admin.class), username, password);
            if (admin.isEmpty()) {
                return null;
            }
            return admin.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查询所有订单
     *
     * @return
     */
    public List<Order> allOrder() {
        try {
            String sql = "SELECT * FROM order_t";
            List<Order> orders = template.query(sql, new BeanPropertyRowMapper<Order>(Order.class));

            return orders;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查询该订单所有项
     *
     * @param orderId
     * @return
     */
    public List<OrderItem> allOrderItem(int orderId) {
        try {
            String sql = "SELECT * FROM orderitem WHERE orderid = ?";
            List<OrderItem> orderItems = template.query(sql, new BeanPropertyRowMapper<OrderItem>(OrderItem.class), orderId);

            return orderItems;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 通过ID查询用户
     *
     * @param userId
     * @return
     */
    public User findUserById(int userId) {
        try {
            String sql = "SELECT * FROM user WHERE id = ?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), userId);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 添加书籍到数据库
     *
     * @param book
     * @return
     */
    public int addBook(Book book) {
        try {
            String sql = "INSERT INTO book (name, author, price, description, imgpath) values(?, ?, ?, ?, ?)";
            int update = template.update(sql, book.getName(), book.getAuthor(), book.getPrice(), book.getDescription(), book.getImgPath());
            return update;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
