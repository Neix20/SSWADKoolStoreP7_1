package service;

import java.util.List;

import javax.ejb.EJBException;

import domain.Order;

public interface OrderServiceInterface {

	public List<Order> getAllOrders() throws EJBException;

	public Order findOrder(String id) throws EJBException;

	public List<Order> findOrderByCustId(int customernumber) throws EJBException;

	public void updateOrder(String[] s) throws EJBException;

	public int addOrder(String customernumber) throws EJBException;

	public List<Order> trackOrderAjax(String id) throws EJBException;

	public int getMaxOrderNumber() throws EJBException;
	
	public List<Order> findOrderList(String username) throws EJBException;
}
