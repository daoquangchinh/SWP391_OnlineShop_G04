/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author ViQuan
 */
public class OrderView {

    private String orderDate;
    private String paymentMethodId;
    private String total;    
    private String statusId;
    private String paymentStatus;
    private int  orderId;

    public OrderView() {
    }

    public OrderView(String orderDate, String paymentMethodId, String total, String statusId, String paymentStatus, int orderId) {
        this.orderDate = orderDate;
        this.paymentMethodId = paymentMethodId;
        this.total = total;
        this.statusId = statusId;
        this.paymentStatus = paymentStatus;
        this.orderId = orderId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(String paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
//@Override
    public String toString() {
        return "OrderView{" +
                "orderDate='" + orderDate + '\'' +
                ", orderId='" + orderId + '\'' +
                ", status='" + statusId + '\'' +
                ", paymentMethodId='" + paymentMethodId + '\'' +
                ", paymentStatus='" + paymentStatus + '\'' +
                ", total='" + total + '\'' +
                '}';
    }
  
}
