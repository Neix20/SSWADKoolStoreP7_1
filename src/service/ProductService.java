package service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

import javax.ejb.EJBException;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.transaction.Transactional;

import domain.Product;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Dependent
@Transactional
public class ProductService implements ProductServiceInterface{
	@PersistenceContext(unitName = "KoolStore")
	EntityManager em;
	
	@Inject
	public ProductService(@PostGresDatabase EntityManager em) {
	this.em = em;
	}
	
	@Override
	public List<Product> getAllProduct() throws EJBException {
		// TODO Auto-generated method stub
		return em.createNamedQuery("Product.findAll").getResultList();
	}
	@Override
	public List<Product> getAllProductByCategory(String category) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		q = em.createNativeQuery("select * from classicmodels.products where productline = '"+category+"'",Product.class);
		List<Product> results = q.getResultList();
		return results;
	}
	@Override
	public List<Product> getAllProductByCategoryWithExclusion(String category,String exclusionCode) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		q = em.createNativeQuery("select * from classicmodels.products where productline = '"+category+"' and productcode != '"+exclusionCode+"'",Product.class);
		List<Product> results = q.getResultList();
		return results;
	}
	
	@Override
	public List<Product> getAllProductWithImage() throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		q = em.createNativeQuery("select * from classicmodels.products");
		List<Product> results = q.getResultList();
		return results;
	}
	
	@Override
	public Product findProduct(String id) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		q = em.createNativeQuery("select * from classicmodels.products where productcode = '"+id+"'",Product.class);
		return (Product) q.getSingleResult();
	}
	
	@Override
	public List<Product> readProduct(int currentPage, int recordsPerPage, String keyword) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		if (keyword.isEmpty()) {
			q = em.createNativeQuery("select * from classicmodels.products order by id OFFSET ? LIMIT ?",
					Product.class);
			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, Integer.valueOf(start));
			q.setParameter(2, Integer.valueOf(recordsPerPage));
		} else {
			q = em.createNativeQuery(
					"SELECT * from classicmodels.products WHERE concat(productcode,productname,productline,productscale,productvendor,buyprice,msrp) LIKE ? order by id OFFSET ? LIMIT ?",
					Product.class);
			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, "%" + keyword + "%");
			q.setParameter(2, Integer.valueOf(start));
			q.setParameter(3, Integer.valueOf(recordsPerPage));
		}
		List<Product> results = q.getResultList();
		return results;
	}
	
	@Override
	public int getNumberOfRows(String keyword) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		if (keyword.isEmpty()) {
			q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.products");
		} else {
			q = em.createNativeQuery(
					"SELECT COUNT(*) AS totalrow from classicmodels.products WHERE concat(productcode,productname,productline,productscale,productvendor) LIKE ?");
			q.setParameter(1, "%" + keyword + "%");
		}
		BigInteger results = (BigInteger) q.getSingleResult();
		int i = results.intValue();
		return i;
	}
	
	@Override
	public void updateProduct(String[] s, int Qty, BigDecimal[] i) throws EJBException {
		// TODO Auto-generated method stub
		Product p = findProduct(s[0]);
		
		p.setProductname(s[1]);
		p.setProductdescription(s[2]);
		p.setProductscale(s[3]);
		p.setProductvendor(s[4]);
		p.setQuantityinstock(Qty);
		p.setBuyprice(i[0]);
		p.setMsrp(i[0]);
		em.merge(p);
	}
	
	@Override
	public void deleteProduct(String id) throws EJBException {
		// TODO Auto-generated method stub
		Product p = findProduct(id);
		em.remove(p);
	}
	
	@Override
	public void addProduct(String[] s,  int Qty, BigDecimal[] i) throws EJBException {
		// TODO Auto-generated method stub
		Product p = new Product();
		p.setProductname(s[1]);
		p.setProductdescription(s[2]);
		p.setProductscale(s[3]);
		p.setProductvendor(s[4]);
		p.setQuantityinstock(Qty);
		p.setBuyprice(i[0]);
		p.setMsrp(i[0]);
		em.persist(p);
	}
}
