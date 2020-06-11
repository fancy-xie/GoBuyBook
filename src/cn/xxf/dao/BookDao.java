package cn.xxf.dao;

import cn.xxf.domain.*;
import cn.xxf.util.JDBCUtils;

import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Date;

import java.text.SimpleDateFormat;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * 书籍或商城DAO
 */
public class BookDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 查找所有书籍
     * @return
     */
    public List<Book> findAll() {
        try {
            String sql = "SELECT * FROM book";
            List<Book> books = template.query(sql, new BeanPropertyRowMapper<Book>(Book.class));
            return books;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 通过书名或作者查找书籍
     * @param searchContent
     * @return
     */
    public List<Book> searchByNameOrAuthor(String searchContent) {
        try {
            String sql = "SELECT * FROM book WHERE name like ? or author like ?";
            List<Book> books = template.query(sql, new BeanPropertyRowMapper<Book>(Book.class), ("%" + searchContent + "%"), ("%" + searchContent + "%"));
            return books;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 添加书籍到购物车
     * @param bookId
     * @param userId
     * @return
     */
    public boolean addBookToCart(String bookId, String userId) {
        try {
            String sql = "SELECT * FROM cart WHERE bookid = ? and userid = ?";
            List<Cart> cart = template.query(sql, new BeanPropertyRowMapper<Cart>(Cart.class), bookId, userId);

            int update;
            if (cart.isEmpty()) {
                sql = "INSERT INTO cart (bookid, userid, quantity) values(?, ?, ?)";
                update = template.update(sql, bookId, userId, 1);
            } else {
                sql = "UPDATE cart SET quantity = quantity + 1 WHERE bookid = ? and userid = ?";
                update = template.update(sql, bookId, userId);
            }
            if (update == 1) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 搜索该用户的购物车
     * @param userId
     * @return
     */
    public List<Cart> findUserCart(Integer userId) {
        try {
            String sql = "SELECT * FROM cart WHERE userid = ?";
            List<Cart> cart = template.query(sql, new BeanPropertyRowMapper<Cart>(Cart.class), userId);

            return cart;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 通过ID查找书籍
     * @param bookId
     * @return
     */
    public Book findBookById(Integer bookId) {
        try {
            String sql = "SELECT * FROM book WHERE id = ?";
            Book book = template.queryForObject(sql, new BeanPropertyRowMapper<Book>(Book.class), bookId);
            return book;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 修改购物车项数量
     * @param quantity
     * @param bookId
     * @param userId
     */
    public void modCartQuantity(String quantity, String bookId, Integer userId) {
        try {
            String sql = "UPDATE cart SET quantity = ? where bookid = ? and userid = ?";
            template.update(sql, quantity, bookId, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }

    /**
     * 清空购物车
     * @param userId
     */
    public void clearCart(Integer userId) {
        try {
            String sql = "DELETE FROM cart where userid = ?";
            template.update(sql, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }

    /**
     * 删除购物车项
     * @param userId
     * @param bookId
     */
    public void delCartItem(Integer userId, String bookId) {
        try {
            String sql = "DELETE FROM cart where userid = ? AND bookid = ?";
            template.update(sql, userId, bookId);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }

    /**
     * 保存订单到数据库
     * @param user
     * @param sumPrice
     * @param cartItemList
     * @return
     */
    public boolean addOrder(User user, String sumPrice, List<CartItem> cartItemList) {
        try {
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");//可以方便地修改日期格式
            String nowTime = dateFormat.format(now);

            String sql = "INSERT INTO order_t (userid, time, price, phone, address, state) values(?, ?, ?, ?, ?, ?)";
            int update = template.update(sql, user.getId(), nowTime, sumPrice, user.getPhone(), user.getTrueName() + " " + user.getCity() + " " + user.getAddress(), 0);
            if (update == 1) {
                sql = "SELECT LAST_INSERT_ID()";
                int orderId = template.queryForObject(sql, Integer.class);

                Iterator<CartItem> iter = cartItemList.iterator();
                while (iter.hasNext()) {
                    DecimalFormat df = new DecimalFormat();
                    df.setMinimumFractionDigits(2);

                    CartItem cartItem = iter.next();
                    sql = "INSERT INTO orderitem (bookid, quantity, sumprice, orderid) VALUES (?, ?, ?, ?)";
                    update = template.update(sql, cartItem.getBookId(), cartItem.getQuantity(), df.format(cartItem.getQuantity() * cartItem.getPrice()), orderId);
                }
                if (update == 1) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 查询所有订单
     * @param userId
     * @return
     */
    public List<Order> allOrder(int userId) {
        try {
            String sql = "SELECT * FROM order_t WHERE userid = ?";
            List<Order> orders = template.query(sql, new BeanPropertyRowMapper<Order>(Order.class), userId);

            return orders;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查询该订单所有订单项
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
     * 修改订单状态
     * @param orderId
     * @param state
     */
    public void changeOrderState(String orderId, String state) {
        try {
            String sql = "UPDATE order_t SET state = ? where id = ?";
            template.update(sql, state, orderId);
            return;
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }
}
