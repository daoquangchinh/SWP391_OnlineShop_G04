/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author ViQuan
 */
public class OrderDetails {
    private int id;
    private int orderId;
    private int shoeId;
    private int productId;
    private double price;
    private int quantity;
    private double totalMoney;
    private int statusId;
    private int paymentId;
    private String shoeName;
    private String shoeColor;
    private int size;
    private String img;

    public OrderDetails(int productId, double price, int quantity, String shoeName, String shoeColor, int size,String img) {
        this.productId = productId;
        this.price = price;
        this.quantity = quantity;
        this.shoeName = shoeName;
        this.shoeColor = shoeColor;
        this.size = size;
        this.img =img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getShoeName() {
        return shoeName;
    }

    public void setShoeName(String shoeName) {
        this.shoeName = shoeName;
    }

    public String getShoeColor() {
        return shoeColor;
    }

    public void setShoeColor(String shoeColor) {
        this.shoeColor = shoeColor;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public OrderDetails(int id, int orderId, int shoeId, int productId, double price, int quantity, double totalMoney, int statusId, int paymentId) {
        this.id = id;   
        this.orderId = orderId;
        this.shoeId = shoeId;
        this.productId = productId;
        this.price = price;
        this.quantity = quantity;
        this.totalMoney = totalMoney;
        this.statusId = statusId;
        this.paymentId = paymentId;
    }

    public OrderDetails() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getShoeId() {
        return shoeId;
    }

    public void setShoeId(int shoeId) {
        this.shoeId = shoeId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "id=" + id + ", orderId=" + orderId + ", shoeId=" + shoeId + ", productId=" + productId + ", price=" + price + ", quantity=" + quantity + ", totalMoney=" + totalMoney + ", statusId=" + statusId + ", paymentId=" + paymentId + '}';
    }
    
}
