package cn.xxf.service;

import cn.xxf.dao.AdminDao;
import cn.xxf.dao.BookDao;
import cn.xxf.domain.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 管理员服务类
 */
public class AdminService {
    private AdminDao dao = new AdminDao();
    private BookDao bookDao = new BookDao();

    /**
     * 登录
     * @param admin
     * @return
     */
    public Admin login(Admin admin) {
        return dao.findByNameAndPassword(admin.getUsername(), admin.getPassword());
    }

    /**
     * 所有订单
     * @return
     */
    public List<Order> AllOrder() {
        return dao.allOrder();
    }

    /**
     * 订单项
     * @param orderId
     * @return
     */
    public List<CartItem> orderItem(int orderId) {
        List<OrderItem> orderItems = dao.allOrderItem(orderId);
        List<CartItem> orderItemList = new ArrayList<>();


        Iterator<OrderItem> iter = orderItems.iterator();

        while (iter.hasNext()) {
            CartItem orderItem = new CartItem();
            OrderItem order = iter.next();
            Book book = bookDao.findBookById(order.getBookID());

            orderItem.setImgPath(book.getImgPath());
            orderItem.setBookId(book.getId());
            orderItem.setBookName(book.getName());
            orderItem.setPrice(book.getPrice());
            orderItem.setQuantity(order.getQuantity());

            orderItemList.add(orderItem);
        }

        return orderItemList;
    }

    /**
     * 订单的用户信息
     * @param userId
     * @return
     */
    public User orderUser(int userId){
        return dao.findUserById(userId);
    }

    /**
     * 添加书籍
     * @param book
     * @return
     */
    public boolean addBook(Book book) {
        if (dao.addBook(book) == 1) {
            return true;
        } else {
            return false;
        }
    }
}
