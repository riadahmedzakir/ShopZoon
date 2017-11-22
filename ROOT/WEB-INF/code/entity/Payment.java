package entity;
 
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product_payment") 
public class Payment {
    private int payment_id;
    @Id
    @GeneratedValue  
    private String order_id;
    private int customer_id;
    private int product_id;
    private String payment_type;
    private String payment_address;
    private String transaction_id;
    public int amount;
    private int success;
     
    /*@OneToMany(mappedBy = "order_id")
    public List<Order> product_order = new ArrayList<Order>();*/
    
    public int getPayment_id() {
        return payment_id;
    } 
    
    public String getOrder_id() {
        return order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public String getPayment_type() {
        return payment_type;
    }

    public String getPayment_address() {
        return payment_address;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public int getAmount() {
        return amount;
    }

    public int getSuccess() {
        return success;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setPayment_type(String payment_type) {
        this.payment_type = payment_type;
    }

    public void setPayment_address(String payment_address) {
        this.payment_address = payment_address;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
} 

