package entity.model; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne; 
import javax.persistence.Table;

@Entity
@Table(name = "Product_Order") 
public class Product_Order {

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
    private String order_date;
    
    @ManyToOne
    @JoinColumn(name = "order_id", insertable = false, updatable = false)
    public Product_Payment payment;
}
