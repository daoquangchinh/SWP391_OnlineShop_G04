/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author ViQuan
 */
public class ProductUpdate {
    // Các trường dữ liệu
    private int id;
    private String img;
    private String name;
    private String color;
    private int size;
    private int quantity;
    private int price;
    private String status;

    @Override
    public String toString() {
        return "ProductUpdate{" + "id=" + id + ", img=" + img + ", name=" + name + ", color=" + color + ", size=" + size + ", quantity=" + quantity + ", price=" + price + ", status=" + status + '}';
    }

    public ProductUpdate() {
    }

    public ProductUpdate(int id, String img, String name, String color, int size, int quantity, int price, String status) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
