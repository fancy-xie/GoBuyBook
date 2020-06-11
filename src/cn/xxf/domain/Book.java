package cn.xxf.domain;

/**
 * 书籍
 */
public class Book {
    private int id; //书ID
    private String name;    //书名
    private String author;  //书作者
    private double price;   //书价格
    private String description; //书简介
    private String imgPath; //图片路径

    public Book() {
    }

    public Book(int id, String name, String author, double price, String description, String imgPath) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.price = price;
        this.description = description;
        this.imgPath = imgPath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", imgPath='" + imgPath + '\'' +
                '}';
    }
}
