package service;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.EJBException;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import domain.Customer;

@Dependent
@Transactional
public class CustomerService implements CustomerServiceInterface {

	private EntityManager em;

	@Inject
	public CustomerService(@PostGresDatabase EntityManager em) {
		this.em = em;
	}
	
	public List<Customer> getAllCustomers() throws EJBException {
		return em.createNamedQuery("Customer.findAll").getResultList();
	}
	
	public Customer getSingleCustomer(String customerNumber) throws EJBException {
		Query q = em.createNamedQuery("Customer.findByNumber");
		q.setParameter("customernumber", Integer.valueOf(customerNumber));
		return (Customer) q.getSingleResult();
	}
	
	public List<Customer> getTargetCustomers(int currentPage, int recordsPerPage, String keyword){
		
		Query q = null;

		if (keyword.isEmpty()) {

			q = em.createNativeQuery("SELECT * FROM classicmodels.customers ORDER BY customerNumber OFFSET ? LIMIT ?", Customer.class);

			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, Integer.valueOf(start));
			q.setParameter(2, Integer.valueOf(recordsPerPage));
			
		} else {
			
			q = em.createNativeQuery("SELECT * FROM classicmodels.customers WHERE concat(customerNumber, customerName, contactLastName, contactFirstName, phone) LIKE ? ORDER BY customerNumber OFFSET ? LIMIT ?", Customer.class);
			
			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, "%" + keyword + "%");
			q.setParameter(2, Integer.valueOf(start));
			q.setParameter(3, Integer.valueOf(recordsPerPage));

		}

		return q.getResultList();
	}
	
	public void addCustomer(String[] datas) throws EJBException{
		
		Customer c = new Customer();
		
		int i = 0;
		c.setCustomernumber(Integer.valueOf(datas[i++]));
		c.setCustomername(datas[i++]);
		c.setContactlastname(datas[i++]);
		c.setContactfirstname(datas[i++]);
		c.setPhone(datas[i++]);
		c.setAddressline1(datas[i++]);
		c.setAddressline2(datas[i++]);
		c.setCity(datas[i++]);
		c.setState(datas[i++]);
		c.setPostalcode(datas[i++]);
		c.setCountry(datas[i++]);
		c.setCreditlimit(BigDecimal.valueOf(Double.valueOf(datas[i++])));
		em.persist(c);
		
	}
	
	public void updateCustomer(String[] datas) throws EJBException{
		
		int i = 0;
		
		Customer c = getSingleCustomer(datas[i++]);
		c.setCustomername(datas[i++]);
		c.setContactlastname(datas[i++]);
		c.setContactfirstname(datas[i++]);
		c.setPhone(datas[i++]);
		c.setAddressline1(datas[i++]);
		c.setAddressline2(datas[i++]);
		c.setCity(datas[i++]);
		c.setState(datas[i++]);
		c.setPostalcode(datas[i++]);
		c.setCountry(datas[i++]);
		c.setCreditlimit(BigDecimal.valueOf(Double.valueOf(datas[i++])));
		em.merge(c);
		
	}
	
	public void deleteCustomer(String customerNumber) throws EJBException{

		Customer c = getSingleCustomer(customerNumber);
		em.remove(c);
		
	}

}
