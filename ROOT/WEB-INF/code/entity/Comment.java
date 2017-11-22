package entity;

public class Comment {
   private int id;
   private int product_id;
   private int people_id;
   private String text;
   private String datetime;

   public void setId(int id) {
       this.id = id;
   }

   public void setProduct_id(int product_id) {
       this.product_id = product_id;
   }

   public void setPeople_id(int people_id) {
       this.people_id = people_id;
   }

   public void setText(String text) {
       this.text = text;
   }

   public void setDatetime(String datetime) {
       this.datetime = datetime;
   }

   public int getId() {
       return id;
   }

   public int getProduct_id() {
       return product_id;
   }

   public int getPeople_id() {
       return people_id;
   }

   public String getText() {
       return text;
   }

   public String getDatetime() {
       return datetime;
   }
   
   
}
