/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author dell
 */
public class Users {
    private int id;
    private String username;
    private String password;
    private String fullname;
    private String gender;
    private String phone;
    private String email;
    private String img;
    private int roleId;
    private int status;
    private String rolename;
    

    public Users(int id, String username, String password, String fullname, String gender, String phone, String email, String img, int roleId, int status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.img = img;
        this.roleId = roleId;
        this.status = status;
    }

    public Users(int id, String username, String password, String fullname, String gender, String phone, String email, String img, int roleId, int status, String rolename) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.img = img;
        this.roleId = roleId;
        this.status = status;
        this.rolename = rolename;
    }
    

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    
    // Getter and Setter for id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // Getter and Setter for password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and Setter for fullname
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    // Getter and Setter for gender
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // Getter and Setter for phone
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for img
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    // Getter and Setter for roleId
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    // Getter and Setter for status
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
