package cn.xxf.domain;

/**
 * 购物车
 */
public class Cart {
    private int id; //购物车项ID
    private int bookID; //书ID
    private int userID; //用户ID
    private Integer quantity;    //书数量

    public Cart() {
    }

    public Cart(int id, int bookID, int userID, Integer quantity) {
        this.id = id;
        this.bookID = bookID;
        this.userID = userID;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", bookID=" + bookID +
                ", userID=" + userID +
                ", quantity=" + quantity +
                '}';
    }
}
