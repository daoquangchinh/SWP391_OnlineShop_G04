/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author Dell
 */
public class Shoe_Color {
    private int id;
    private int shoe_id;
    private int  product_color_id;
    private int quantity;

    public Shoe_Color() {
    }

    public Shoe_Color(int id, int shoe_id, int product_color_id, int quantity) {
        this.id = id;
        this.shoe_id = shoe_id;
        this.product_color_id = product_color_id;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShoe_id() {
        return shoe_id;
    }

    public void setShoe_id(int shoe_id) {
        this.shoe_id = shoe_id;
    }

    public int getProduct_color_id() {
        return product_color_id;
    }

    public void setProduct_color_id(int product_color_id) {
        this.product_color_id = product_color_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
