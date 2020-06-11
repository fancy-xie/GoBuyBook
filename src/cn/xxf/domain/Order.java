package cn.xxf.domain;

/**
 * 订单
 */
public class Order {
    private int id; //订单ID
    private int userId; //用户ID
    private String time;   //下单时间
    private double price;   //订单价格
    private String phone;   //手机号
    private String address; //地址
    private int state;  //订单状态（0为未发货，1为已发货，2为已收货，3为已取消）

    public Order() {
    }

    public Order(int id, int userId, String time, double price, String phone, String address, int state) {
        this.id = id;
        this.userId = userId;
        this.time = time;
        this.price = price;
        this.phone = phone;
        this.address = address;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", time='" + time + '\'' +
                ", price=" + price +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", state=" + state +
                '}';
    }
}
