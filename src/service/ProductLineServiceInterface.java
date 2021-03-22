package service;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.EJBException;

import domain.Productline;
public interface ProductLineServiceInterface {
	
	public List<Productline> getAllProductline() throws EJBException;
	public Productline findProductline(String id) throws EJBException;
	public List<Productline> readProductline(int currentPage, int recordsPerPage, String keyword) throws EJBException;
	public int getNumberOfRows(String keyword) throws EJBException ;
	public void updateProductline(String[] s) throws EJBException;
	public void deleteProductline(String id) throws EJBException;
	public void addProductline(String[] s) throws EJBException;
}