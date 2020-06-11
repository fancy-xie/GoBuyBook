package cn.xxf.service;

import cn.xxf.domain.User;
import cn.xxf.dao.UserDao;

import java.util.List;

/**
 * 用户服务类
 */
public class UserService {
    private UserDao dao = new UserDao();

    /**
     * 用户登录
     *
     * @param user
     * @return
     */
    public User login(User user) {
        return dao.findUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    /**
     * 判断用户名是否存在
     *
     * @param username
     * @return
     */
    public boolean isUsernameExist(String username) {
        return dao.findIsUsernameExist(username);
    }

    /**
     * 用户注册
     *
     * @param user
     * @return
     */
    public boolean register(User user) {
        if (dao.AddUser(user) == 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 修改信息
     *
     * @param user
     */
    public void modInfo(User user) {
        dao.modInfo(user);
    }

    /**
     * 修改密码
     *
     * @param user
     * @param oldPassword
     * @param newPassword
     * @return
     */
    public int modPassword(User user, String oldPassword, String newPassword) {
        return dao.modPassword(user, oldPassword, newPassword);
    }
}
