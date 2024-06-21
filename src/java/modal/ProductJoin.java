/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author Dell
 */
public class ProductJoin {
    private int id;
    private int shoe_id;
    private int shoe_size_id;
    private int shoe_color_id;
    private int quantity;
    private int size;

    public ProductJoin() {
    }

    public ProductJoin(int id, int shoe_id, int shoe_size_id, int shoe_color_id, int quantity, int size) {
        this.id = id;
        this.shoe_id = shoe_id;
        this.shoe_size_id = shoe_size_id;
        this.shoe_color_id = shoe_color_id;
        this.quantity = quantity;
        this.size = size;
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

    public int getShoe_size_id() {
        return shoe_size_id;
    }

    public void setShoe_size_id(int shoe_size_id) {
        this.shoe_size_id = shoe_size_id;
    }

    public int getShoe_color_id() {
        return shoe_color_id;
    }

    public void setShoe_color_id(int shoe_color_id) {
        this.shoe_color_id = shoe_color_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }



   
    
    
}
