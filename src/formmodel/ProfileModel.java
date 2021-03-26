package formmodel;

public class ProfileModel extends Model{
	
	private int customernumber;
	private String addressline1;
	private String addressline2;
	private String city;
	private String contactfirstname;
	private String contactlastname;
	private String country;
	private double creditlimit;
	private String customername;
	private String phone;
	private String postalcode;
	private String state;
	
	public ProfileModel() {
		super();
		this.addressline1 = "";
		this.addressline2 = "";
		this.city = "";
		this.contactfirstname = "";
		this.contactlastname = "";
		this.country = "";
		this.creditlimit = 0.0;
		this.customername = "";
		this.phone = "";
		this.postalcode = "";
		this.state = "";
		
	}

	public int getCustomernumber() {
		return customernumber;
	}

	public void setCustomernumber(int customernumber) {
		this.customernumber = customernumber;
	}

	public String getAddressline1() {
		return addressline1;
	}

	public void setAddressline1(String addressline1) {
		this.addressline1 = addressline1;
	}

	public String getAddressline2() {
		return addressline2;
	}

	public void setAddressline2(String addressline2) {
		this.addressline2 = addressline2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getContactfirstname() {
		return contactfirstname;
	}

	public void setContactfirstname(String contactfirstname) {
		this.contactfirstname = contactfirstname;
	}

	public String getContactlastname() {
		return contactlastname;
	}

	public void setContactlastname(String contactlastname) {
		this.contactlastname = contactlastname;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public double getCreditlimit() {
		return creditlimit;
	}

	public void setCreditlimit(double creditlimit) {
		this.creditlimit = creditlimit;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
