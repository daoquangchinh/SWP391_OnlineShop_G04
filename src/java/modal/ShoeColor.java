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
public class ShoeColor {
    private  int id ;
    private  String color;
    private  List<ShoeSize> sizes;

    public List<ShoeSize> getSizes() {
        return sizes;
    }

    public void setSizes(List<ShoeSize> sizes) {
        this.sizes = sizes;
    }

    public ShoeColor(int id, String color, List<ShoeSize> sizes) {
        this.id = id;
        this.color = color;
        this.sizes = sizes;
    }

    

    public ShoeColor(int id, String color) {
        this.id = id;
        this.color = color;
    }

    public ShoeColor() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "ShoeColor{" + "id=" + id + ", color=" + color + ", sizes=" + sizes + '}';
    }

    
    
    
}
