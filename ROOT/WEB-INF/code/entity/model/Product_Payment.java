package entity.model; 
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Product_Payment") 
public class Product_Payment {
    public int payment_id;
    @Id
    @GeneratedValue  
    public String order_id;
    public int customer_id;
    public int product_id;
    public String payment_type;
    public String payment_address;
    public String transaction_id;
    public int amount;
    public int success;
     
    @OneToMany(mappedBy = "order_id")
    public List<Product_Order> product_order = new ArrayList<Product_Order>();

} 

