package cn.xxf.service;

import cn.xxf.dao.BookDao;
import cn.xxf.domain.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 书籍或商城服务类
 */
public class BookService {
    private BookDao dao = new BookDao();

    /**
     * 查找所有书籍
     *
     * @return
     */
    public List<Book> findAll() {
        return dao.findAll();
    }

    /**
     * 搜索书籍
     *
     * @param searchContent
     * @return
     */
    public List<Book> search(String searchContent) {
        return dao.searchByNameOrAuthor(searchContent);
    }

    /**
     * 添加到购物车
     *
     * @param bookId
     * @param userId
     * @return
     */
    public boolean addToCart(String bookId, String userId) {
        return dao.addBookToCart(bookId, userId);
    }

    /**
     * 获取购物车列表
     *
     * @param userId
     * @return
     */
    public List<CartItem> cartList(Integer userId) {
        List<Cart> cartList = dao.findUserCart(userId);
        List<CartItem> cartItemList = new ArrayList<>();

        if (!cartList.isEmpty()) {
            Iterator<Cart> iter = cartList.iterator();

            while (iter.hasNext()) {
                CartItem cartItem = new CartItem();
                Cart cart = iter.next();
                Book book = dao.findBookById(cart.getBookID());

                cartItem.setImgPath(book.getImgPath());
                cartItem.setBookId(book.getId());
                cartItem.setBookName(book.getName());
                cartItem.setPrice(book.getPrice());
                cartItem.setQuantity(cart.getQuantity());

                cartItemList.add(cartItem);
            }
        }

        return cartItemList;
    }

    /**
     * 修改购物车项数量
     *
     * @param quantity
     * @param bookId
     * @param userId
     */
    public void modQuantity(String quantity, String bookId, Integer userId) {
        dao.modCartQuantity(quantity, bookId, userId);
    }

    /**
     * 清空购物车
     *
     * @param userId
     */
    public void clearCart(Integer userId) {
        dao.clearCart(userId);
    }

    /**
     * 删除购物车项
     *
     * @param userId
     * @param bookId
     */
    public void delCart(Integer userId, String bookId) {
        dao.delCartItem(userId, bookId);
    }

    /**
     * 添加订单
     *
     * @param user
     * @param sumPrice
     * @return
     */
    public boolean addOrder(User user, String sumPrice) {
        boolean isAddSuccess = dao.addOrder(user, sumPrice, this.cartList(user.getId()));
        if (isAddSuccess) {
            this.clearCart(user.getId());
        }
        return isAddSuccess;
    }

    /**
     * 所有订单
     *
     * @param userId
     * @return
     */
    public List<Order> userAllOrder(int userId) {
        return dao.allOrder(userId);
    }

    /**
     * 订单项
     *
     * @param orderId
     * @return
     */
    public List<CartItem> userOrderItem(int orderId) {
        List<OrderItem> orderItems = dao.allOrderItem(orderId);
        List<CartItem> orderItemList = new ArrayList<>();


        Iterator<OrderItem> iter = orderItems.iterator();

        while (iter.hasNext()) {
            CartItem orderItem = new CartItem();
            OrderItem order = iter.next();
            Book book = dao.findBookById(order.getBookID());

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
     * 修改订单状态
     *
     * @param orderId
     * @param state
     */
    public void changeOrderState(String orderId, String state) {
        dao.changeOrderState(orderId, state);
        return;
    }

    /**
     * 根据ID查找书籍
     *
     * @param bookId
     * @return
     */
    public Book findBook(Integer bookId) {
        return dao.findBookById(bookId);
    }
}
