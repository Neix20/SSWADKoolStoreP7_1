package service;

import java.util.List;

import javax.ejb.EJBException;

import domain.Orderdetail;

public interface OrderDetailServiceInterface {

	public List<Orderdetail> getAllOrderDetails() throws EJBException;

	public Orderdetail findSingleOrderDetails(String ordernumber, String productcode) throws EJBException;
	
	public List<Orderdetail> findOrderDetails(String ordernumber) throws EJBException;

	public void addOrderDetails(String[] s) throws EJBException;
}
