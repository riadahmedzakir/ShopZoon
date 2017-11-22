package entity;

public class People {
    private  int id; 
    private  String fname;
    private  String lname;
    private  String username;
    private  String email; 
    private  String password; 
    private  String phone; 
    private  String location; 
    private  String cookies; 
    private  int logfail; 
    private  String type; 
    private  int active; 
    private  String rating;
    private  String area;

    public void setId(int id) {
        this.id = id;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setCookies(String cookies) {
        this.cookies = cookies;
    }

    public void setLogfail(int logfail) {
        this.logfail = logfail;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getArea() {
        return area;
    }

    public int getId() {
        return id;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone() {
        return phone;
    }

    public String getLocation() {
        return location;
    }

    public String getCookies() {
        return cookies;
    }

    public int getLogfail() {
        return logfail;
    }

    public String getType() {
        return type;
    }

    public int getActive() {
        return active;
    }

    public String getRating() {
        return rating;
    }
    
    public void setArea(String area) {
        this.area = area;
    }
}