package forcely;

public class Customer {
    
    private String firstname;
	  private String lastname;
    private String phone;     
    private String street;
    private String area;
    private String postalcode;
   	private String email;


    public Customer(String firstname, String lastname, String phone, String street, String area, String postalcode, String email) {        
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.street = street;
        this.area = area;
        this.postalcode = postalcode;
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }
    
    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
    
    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
