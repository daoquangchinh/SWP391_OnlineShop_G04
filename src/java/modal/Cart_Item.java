/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

import java.util.List;

/**
 *
 * @author ViQuan
 */

public class Cart_Item {

    private int idCartItem;
    private String img;
    private String shoe_name;
    private int size;
    private String color;
    private Double price;
    private int quatityCart;
    private int quatityProduct;
    private int shoe_id;
    private List<ShoeColor> availableColors; // Danh sách các màu sắc có sẵn cho sản phẩm
    private int status_id ;
    @Override
    public String toString() {
        return "Cart_Item{" +
                "idCartItem=" + idCartItem +
                ", img='" + img + '\'' +
                ", shoe_name='" + shoe_name + '\'' +
                ", size=" + size +
                ", color='" + color + '\'' +
                ", price=" + price +
                ", quatityCart=" + quatityCart +
                ", quatityProduct=" + quatityProduct +
                ", shoe_id=" + shoe_id +
                ", availableColors=" + availableColors +
                 ", status_id=" + status_id +
                '}';
    }

    public Cart_Item(int idCartItem, String img, String shoe_name, int size, String color, Double price, int quatityCart, int quatityProduct, int shoe_id) {
        this.idCartItem = idCartItem;
        this.img = img;
        this.shoe_name = shoe_name;
        this.size = size;
        this.color = color;
        this.price = price;
        this.quatityCart = quatityCart;
        this.quatityProduct = quatityProduct;
        this.shoe_id = shoe_id;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public int getIdCartItem() {
        return idCartItem;
    }

    public void setIdCartItem(int idCartItem) {
        this.idCartItem = idCartItem;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getShoe_name() {
        return shoe_name;
    }

    public void setShoe_name(String shoe_name) {
        this.shoe_name = shoe_name;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getQuatityCart() {
        return quatityCart;
    }

    public void setQuatityCart(int quatityCart) {
        this.quatityCart = quatityCart;
    }

    public int getQuatityProduct() {
        return quatityProduct;
    }

    public void setQuatityProduct(int quatityProduct) {
        this.quatityProduct = quatityProduct;
    }

    public int getShoe_id() {
        return shoe_id;
    }

    public void setShoe_id(int shoe_id) {
        this.shoe_id = shoe_id;
    }

    public List<ShoeColor> getAvailableColors() {
        return availableColors;
    }

    public void setAvailableColors(List<ShoeColor> availableColors) {
        this.availableColors = availableColors;
    }

    public Cart_Item(int idCartItem, String img, String shoe_name, int size, String color, Double price, int quatityCart, int quatityProduct, int shoe_id, List<ShoeColor> availableColors,int status_id) {
        this.idCartItem = idCartItem;
        this.img = img;
        this.shoe_name = shoe_name;
        this.size = size;
        this.color = color;
        this.price = price;
        this.quatityCart = quatityCart;
        this.quatityProduct = quatityProduct;
        this.shoe_id = shoe_id;
        this.availableColors = availableColors;
        this.status_id = status_id;
    }
  
    public Cart_Item() {
    }
}