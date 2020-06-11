package cn.xxf.domain;

/**
 * 用户
 */
public class User {
    private int id; //用户ID
    private String username;    //用户名
    private String password; //用户密码
    private String trueName;  //真名
    private String phone;   //手机号
    private String city;    //城市
    private String address; //地址

    public User() {
    }

    public User(int id, String username, String password, String trueName, String phone, String city, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.trueName = trueName;
        this.phone = phone;
        this.city = city;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", trueName='" + trueName + '\'' +
                ", phone='" + phone + '\'' +
                ", city='" + city + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
