/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author Dell
 */
public class Sports{
    private int id;
    private String Sports_name;

    public Sports() {
    }

    public Sports(int id, String Sports_name) {
        this.id = id;
        this.Sports_name = Sports_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSports_name() {
        return Sports_name;
    }

    public void setSports_name(String Sports_name) {
        this.Sports_name = Sports_name;
    }
    
    
}
