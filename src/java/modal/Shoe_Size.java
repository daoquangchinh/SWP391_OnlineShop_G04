/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author Dell
 */
public class Shoe_Size {
    private int id;
    private int shoe_color_id;
    private int product_size_id;
    private int quantity;

    public Shoe_Size() {
    }

    public Shoe_Size(int id, int shoe_color_id, int product_size_id, int quantity) {
        this.id = id;
        this.shoe_color_id = shoe_color_id;
        this.product_size_id = product_size_id;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShoe_color_id() {
        return shoe_color_id;
    }

    public void setShoe_color_id(int shoe_color_id) {
        this.shoe_color_id = shoe_color_id;
    }

    public int getProduct_size_id() {
        return product_size_id;
    }

    public void setProduct_size_id(int product_size_id) {
        this.product_size_id = product_size_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
