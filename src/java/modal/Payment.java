/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author ViQuan
 */
public class Payment {

    private int id;
    private String paymentStatus;
    private String paymentMethod;

    public Payment(int id, String paymentStatus, String paymentMethod) {
        this.id = id;
        this.paymentStatus = paymentStatus;
        this.paymentMethod = paymentMethod;
    }

    public Payment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return "Payment{" + "id=" + id + ", paymentStatus=" + paymentStatus + ", paymentMethod=" + paymentMethod + '}';
    }
    
}
