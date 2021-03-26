package service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.EJBException;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import domain.Order;

@Dependent
@Transactional
public class OrderService implements OrderServiceInterface{

	@PersistenceContext(unitName = "KoolStore")
	EntityManager em;
	
	@Inject
	public OrderService(@PostGresDatabase EntityManager em) {
		this.em = em;
	}
	
	@Override
	public List<Order> getAllOrders() throws EJBException {
		// TODO Auto-generated method stub
		return em.createNamedQuery("Order.findAll").getResultList();
	}

	@Override
	public Order findOrder(String id) throws EJBException {
		// TODO Auto-generated method stub
		Query q = em.createNamedQuery("Order.findbyId");
		q.setParameter("ordernumber", Integer.valueOf(id));
		return (Order) q.getSingleResult();
	}
	
	@Override
	public List<Order> findOrderByCustId(int customernumber) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		
		q = em.createNativeQuery("SELECT * FROM classicmodels.orders WHERE customernumber = ?", Order.class);
		q.setParameter(1, customernumber);
		return q.getResultList();
	}

	@Override
	public void updateOrder(Order order) throws EJBException {
		// TODO Auto-generated method stub
		em.merge(order);
		
	}

	@Override
	public int addOrder(String customernumber) throws EJBException {
		// TODO Auto-generated method stub
		Order order = new Order();
		int ordernumber = getMaxOrderNumber() + 1;
		Date orderDate = new Date(System.currentTimeMillis());

		Calendar c = Calendar.getInstance();
		c.setTime(orderDate);
		c.add(Calendar.DAY_OF_YEAR, getRandomInteger(3, 14));
		Date requireddate = c.getTime();
		
		order.setOrdernumber(ordernumber);
		order.setOrderdate(orderDate.toString());
		order.setRequireddate(requireddate.toString());
		order.setShippeddate(null);
		order.setStatus("Pending");
		order.setComments(null);
		order.setCustomernumber(Integer.parseInt(customernumber));
		em.persist(order);
		
		return ordernumber;
	}

	@Override
	public List<Order> trackOrderAjax(String id) throws EJBException {
		// TODO Auto-generated method stub
		Query q = em.createNamedQuery("Order.findbyId");
		try {
			Long d = Long.valueOf(id);
		} catch (NumberFormatException nfe) {
			return null;
		}
		q.setParameter("id", Long.valueOf(id));
		List<Order> h = q.getResultList();
		// System.out.println("test");
		if (h.isEmpty()) {
			return null;
		} else {
			return h;
		}
	}

	@Override
	public int getMaxOrderNumber() throws EJBException {

		Query q = em.createNativeQuery("SELECT max(ordernumber) FROM classicmodels.orders");
		
		return (int) q.getSingleResult();
	}
	
	// generate random number of days for required date
	public int getRandomInteger(int min, int max) { 
		return ((int) (Math.random()*(max - min))) + min; 
	}

	@Override
	public List<Order> findOrderList(String username) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		
		q = em.createNativeQuery("SELECT ordernumber,orderdate,requireddate,shippeddate,status " +
		" FROM classicmodels.orders WHERE customernumber = " +  
		" (SELECT customernumber FROM classicmodels.users WHERE username='admin') " +
		" ORDER BY orderdate) ", Order.class);
		
		return (List<Order>) q.getResultList();
	}
}
