/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author Dell
 */
public class Img {
    private int id;
    private String img;
    private int shoe_id;
    private int shoe_color_id;

    public Img() {
    }

    public Img(int id, String img, int shoe_id, int shoe_color_id) {
        this.id = id;
        this.img = img;
        this.shoe_id = shoe_id;
        this.shoe_color_id = shoe_color_id;
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

    public int getShoe_id() {
        return shoe_id;
    }

    public void setShoe_id(int shoe_id) {
        this.shoe_id = shoe_id;
    }

    public int getShoe_color_id() {
        return shoe_color_id;
    }

    public void setShoe_color_id(int shoe_color_id) {
        this.shoe_color_id = shoe_color_id;
    }
    
    
}
