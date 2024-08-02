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
public class OrderView {

    private String orderDate;
    private String paymentMethodId;
    private String total;    
    private String statusId;
    private String paymentStatus;
    private int  orderId;
    private List<OrderDetails> listOrderItem;

    public OrderView(String orderDate, String paymentMethodId, String total, String statusId, String paymentStatus, int orderId, List<OrderDetails> listOrderItem) {
        this.orderDate = orderDate;
        this.paymentMethodId = paymentMethodId;
        this.total = total;
        this.statusId = statusId;
        this.paymentStatus = paymentStatus;
        this.orderId = orderId;
        this.listOrderItem = listOrderItem;
    }

    public List<OrderDetails> getListOrderItem() {
        return listOrderItem;
    }

    public void setListOrderItem(List<OrderDetails> listOrderItem) {
        this.listOrderItem = listOrderItem;
    }
    
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

    @Override
    public String toString() {
        return "OrderView{" + "orderDate=" + orderDate + ", paymentMethodId=" + paymentMethodId + ", total=" + total + ", statusId=" + statusId + ", paymentStatus=" + paymentStatus + ", orderId=" + orderId + ", listOrderItem=" + listOrderItem + '}';
    }

}
