package service;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.EJBException;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import domain.Orderdetail;
import domain.OrderdetailPK;

@Dependent
@Transactional
public class OrderDetailService implements OrderDetailServiceInterface {

	@PersistenceContext(unitName = "KoolStore")
	EntityManager em;

	@Inject
	public OrderDetailService(@PostGresDatabase EntityManager em) {
		this.em = em;
	}

	@Override
	public List<Orderdetail> getAllOrderDetails() throws EJBException {
		// TODO Auto-generated method stub
		return em.createNamedQuery("Orderdetail.findAll").getResultList();
	}

	@Override
	public Orderdetail findSingleOrderDetails(String ordernumber, String productcode) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;

		q = em.createNativeQuery(
				"SELECT * FROM classicmodels.orderdetails WHERE ordernumber = ? AND productcode = \'?\'",
				Orderdetail.class);
		q.setParameter(1, Integer.valueOf(ordernumber));
		q.setParameter(2, productcode);
		return (Orderdetail) q.getSingleResult();
	}
	
	@Override
	public List<Orderdetail> findOrderDetails(String ordernumber) throws EJBException {
		// TODO Auto-generated method stub
		
		Query q = em.createNamedQuery("Orderdetail.findbyId");
		q.setParameter("ordernumber", Integer.valueOf(ordernumber));
		
		return (List<Orderdetail>) q.getResultList();
	}

	@Override
	public void addOrderDetails(String[] s) throws EJBException {
		// TODO Auto-generated method stub
		OrderdetailPK detailPK = new OrderdetailPK();
		Orderdetail detail = new Orderdetail();
		detailPK.setOrdernumber(Integer.parseInt(s[0]));
		detailPK.setProductcode(s[1]);
		detail.setId(detailPK);
		detail.setQuantityordered(Integer.parseInt(s[2]));
		detail.setPriceeach(BigDecimal.valueOf(Double.parseDouble(s[3])));
		detail.setOrderlinenumber(Integer.parseInt(s[4]));
		em.persist(detail);
	}
}
