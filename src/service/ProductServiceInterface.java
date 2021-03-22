package service;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.EJBException;

import domain.Product;
public interface ProductServiceInterface {
	
	public List<Product> getAllProduct() throws EJBException;
	public List<Product> getAllProductByCategory(String category) throws EJBException;
	public List<Product> getAllProductByCategoryWithExclusion(String category,String exclusion) throws EJBException;
	public List<Product> getAllProductWithImage() throws EJBException;
	public Product findProduct(String id) throws EJBException;
	public List<Product> readProduct(int currentPage, int recordsPerPage, String keyword) throws EJBException;
	public int getNumberOfRows(String keyword) throws EJBException ;
	public void updateProduct(String[] s, int Qty, BigDecimal[] i) throws EJBException;
	public void deleteProduct(String id) throws EJBException;
	public void addProduct(String[] s,  int Qty, BigDecimal[] i) throws EJBException;
}
