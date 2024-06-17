/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author ViQuan
 */
public class ShoeColor {
    private  int id ;
    private  String color;

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
        return "ShoeColor{" + "id=" + id + ", color=" + color + '}';
    }
    
    
}
