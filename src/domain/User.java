package domain;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users", schema="classicmodels")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
@NamedQuery(name="User.findByUsername", query="SELECT u FROM User u WHERE u.username = :username")
@NamedQuery(name="User.checkPassword", query="SELECT u FROM User u WHERE u.username = :username AND u.password = :password")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String username;

	private String password;

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="customernumber", insertable=false, updatable=false)
	private Customer customer;

	public User() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}