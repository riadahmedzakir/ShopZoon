package entity; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne; 
import javax.persistence.Table;

@Entity
@Table(name = "product_order") 
public class Order {
 
    @Id 
    @GeneratedValue 
    public String order_id;
    private int customer_id;
    private int deliver_id;
    private int product_id;
    private int product_qty;
    private int product_price;
    private int product_delivery_cost;
    private int payment_id;
    private String action;
    private String customer_name;
    private String customer_address;
    private String customer_district;
    private String customer_phone;
    @Column(name="order_date")
    private String date;
    
    /*@ManyToOne
    @JoinColumn(name = "order_id", insertable = false, updatable = false)
    public Payment payment;*/
  
    public String getId() {
        return order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public int getDeliver_id() {
        return deliver_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public int getProduct_qty() {
        return product_qty;
    }

    public int getProduct_price() {
        return product_price;
    }

    public int getProduct_delivery_cost() {
        return product_delivery_cost;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public String getAction() {
        return action;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public String getCustomer_district() {
        return customer_district;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }
    
    public String getDate() {
        return date;
    }
    
    
    public void setId(String order_id) {
        this.order_id = order_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public void setDeliver_id(int deliver_id) {
        this.deliver_id = deliver_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setProduct_qty(int product_qty) {
        this.product_qty = product_qty;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public void setProduct_delivery_cost(int product_delivery_cost) {
        this.product_delivery_cost = product_delivery_cost;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public void setAction(String action) {
        this.action = action;
    } 

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }

    public void setCustomer_district(String customer_district) {
        this.customer_district = customer_district;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
}
