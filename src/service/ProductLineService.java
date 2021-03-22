package service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

import javax.ejb.EJBException;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.transaction.Transactional;

import domain.Productline;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Dependent
@Transactional
public class ProductLineService implements ProductLineServiceInterface{
	@PersistenceContext(unitName = "KoolStore")
	EntityManager em;
	
	@Inject
	public ProductLineService(@PostGresDatabase EntityManager em) {
	this.em = em;
	}
	
	@Override
	public List<Productline> getAllProductline() throws EJBException {
		// TODO Auto-generated method stub
		return em.createNamedQuery("Productline.findAll").getResultList();
	}
	
	@Override
	public Productline findProductline(String id) throws EJBException {
		// TODO Auto-generated method stub
		Query q = em.createNamedQuery("Productline.findbyId");
		q.setParameter("id", Long.valueOf(id));
		return (Productline) q.getSingleResult();
	}
	
	@Override
	public List<Productline> readProductline(int currentPage, int recordsPerPage, String keyword) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		if (keyword.isEmpty()) {
			q = em.createNativeQuery("select * from classicmodels.productlines order by id OFFSET ? LIMIT ?",
					Productline.class);
			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, Integer.valueOf(start));
			q.setParameter(2, Integer.valueOf(recordsPerPage));
		} else {
			q = em.createNativeQuery(
					"SELECT * from classicmodels.productlines WHERE concat(productline, textdescription, htmldescription) LIKE ? order by id OFFSET ? LIMIT ?",
					Productline.class);
			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, "%" + keyword + "%");
			q.setParameter(2, Integer.valueOf(start));
			q.setParameter(3, Integer.valueOf(recordsPerPage));
		}
		List<Productline> results = q.getResultList();
		return results;
	}
	
	@Override
	public int getNumberOfRows(String keyword) throws EJBException {
		// TODO Auto-generated method stub
		Query q = null;
		if (keyword.isEmpty()) {
			q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.productlines");
		} else {
			q = em.createNativeQuery(
					"SELECT COUNT(*) AS totalrow from classicmodels.productlines WHERE concat(productline, textdescription, htmldescription) LIKE ?");
			q.setParameter(1, "%" + keyword + "%");
		}
		BigInteger results = (BigInteger) q.getSingleResult();
		int i = results.intValue();
		return i;
	}
	
	@Override
	public void updateProductline(String[] s) throws EJBException {
		// TODO Auto-generated method stub
		Productline p = findProductline(s[0]);
		
		p.setTextdescription(s[1]);
		p.setHtmldescription(s[2]);
		p.setImage(s[3]);
		em.merge(p);
	}
	
	@Override
	public void deleteProductline(String id) throws EJBException {
		// TODO Auto-generated method stub
		Productline p = findProductline(id);
		em.remove(p);
	}
	
	@Override
	public void addProductline(String[] s) throws EJBException {
		// TODO Auto-generated method stub
		Productline p = new Productline();
		p.setTextdescription(s[1]);
		p.setHtmldescription(s[2]);
		p.setImage(s[3]);
		em.persist(p);
	}
}
