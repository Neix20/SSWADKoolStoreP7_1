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
import domain.Payment;

@Dependent
@Transactional
public class PaymentService {

	private EntityManager em;

	@Inject
	public PaymentService(@PostGresDatabase EntityManager em) {
		this.em = em;
	}
	
	public List<Payment> getAllPayments() throws EJBException {
		return em.createNamedQuery("Payment.findAll").getResultList();
	}
	
	public Payment getSinglePayment(String customerNumber) throws EJBException {
		Query q = em.createNamedQuery("Payment.findByNumber");
		Query cust_q = em.createNamedQuery("Customer.findByNumber");
		cust_q.setParameter("customernumber", Integer.valueOf(customerNumber));
		q.setParameter("customer", cust_q.getSingleResult());
		return (Payment) q.getSingleResult();
	}
	
	public List<Payment> getTargetPayments(int currentPage, int recordsPerPage, String keyword){
		
		Query q = null;

		if (keyword.isEmpty()) {

			q = em.createNativeQuery("SELECT * FROM classicmodels.payments ORDER BY customerNumber OFFSET ? LIMIT ?", Payment.class);

			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, Integer.valueOf(start));
			q.setParameter(2, Integer.valueOf(recordsPerPage));
			
		} else {
			
			q = em.createNativeQuery("SELECT * FROM classicmodels.payments WHERE concat(customerNumber, checkName) LIKE ? ORDER BY customerNumber OFFSET ? LIMIT ?", Payment.class);
			
			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, "%" + keyword + "%");
			q.setParameter(2, Integer.valueOf(start));
			q.setParameter(3, Integer.valueOf(recordsPerPage));

		}

		return q.getResultList();
	}
	
	public void addPayment(String[] datas) throws EJBException{
		
		Payment p = new Payment();
		
		int i = 0;
		Query q = em.createNamedQuery("Customer.findByNumber");
		q.setParameter("customernumber", Integer.valueOf(datas[i++]));
		p.setCustomer((Customer) q.getSingleResult());
		p.setAmount(BigDecimal.valueOf(Double.valueOf(datas[i++])));
		p.setPaymentdate(datas[i++]);
		em.persist(p);
		
	}
	
	public void updatePayment(String[] datas) throws EJBException{
		
		Payment p = new Payment();
		
		int i = 0;
		Query q = em.createNamedQuery("Customer.findByNumber");
		q.setParameter("customernumber", Integer.valueOf(datas[i++]));
		p.setCustomer((Customer) q.getSingleResult());
		p.setAmount(BigDecimal.valueOf(Double.valueOf(datas[i++])));
		p.setPaymentdate(datas[i++]);
		em.persist(p);
		
	}
	
	public void deletePayment(String customerNumber) throws EJBException{

		Payment p = getSinglePayment(customerNumber);
		em.remove(p);
		
	}
	
}
