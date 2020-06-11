package cn.xxf.dao;

import cn.xxf.domain.Order;
import cn.xxf.domain.User;
import cn.xxf.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

/**
 * 用户DAO
 */
public class UserDao {

    //JDBC模板对象
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 通过用户名和密码查找用户
     *
     * @param username
     * @param password
     * @return
     */
    public User findUserByUsernameAndPassword(String username, String password) {
        try {
            String sql = "select * from user where username = ? and password = ?";
            List<User> user = template.query(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            if (user.isEmpty()) {
                return null;
            }
            return user.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 判断的用户名是否存在数据库
     *
     * @param username
     * @return
     */
    public boolean findIsUsernameExist(String username) {
        try {
            String sql = "select count(*) from user where username = ?";
            int count = template.queryForObject(sql, Integer.class, username);
            if (count == 0) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 添加用户到数据库
     *
     * @param user
     * @return
     */
    public int AddUser(User user) {
        try {
            String sql = "INSERT INTO user (username, password, truename, phone, city, address) values(?, ?, ?, ?, ?, ?)";
            int update = template.update(sql, user.getUsername(), user.getPassword(), user.getTrueName(), user.getPhone(), user.getCity(), user.getAddress());
            return update;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 修改用户信息
     *
     * @param user
     */
    public void modInfo(User user) {
        try {
            String sql = "UPDATE user SET truename = ?, phone = ?, city = ?, address = ? WHERE id = ?";
            template.update(sql, user.getTrueName(), user.getPhone(), user.getCity(), user.getAddress(), user.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改用户密码
     *
     * @param loginUser
     * @param oldPassword
     * @param newPassword
     * @return
     */
    public int modPassword(User loginUser, String oldPassword, String newPassword) {
        try {
            String sql = "select * from user where username = ? and password = ?";
            List<User> user = template.query(sql, new BeanPropertyRowMapper<User>(User.class), loginUser.getUsername(), oldPassword);

            if (user.isEmpty()) {
                return 1;
            } else {
                sql = "UPDATE user SET password = ? WHERE id = ?";
                int update = template.update(sql, newPassword, loginUser.getId());

                if (update == 1) {
                    return 0;
                } else {
                    return 2;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }
}
