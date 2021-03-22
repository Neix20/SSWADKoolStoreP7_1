package service;

import java.util.List;

import javax.ejb.EJBException;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.transaction.Transactional;

import domain.User;

@Dependent
@Transactional
public class UserService implements UserServiceInterface {

	private EntityManager em;

	@Inject
	public UserService(@PostGresDatabase EntityManager em) {
		this.em = em;
	}
	
	public boolean checkPassword(String username, String password) {
		
		try {
			Query q = em.createNamedQuery("User.checkPassword");
			q.setParameter("username", username);
			q.setParameter("password", password);
			q.getSingleResult();
		} catch(NoResultException e) {
			return false;
		}
		
		return true;
	}

	public boolean isDuplicated(String username) {
		
		try {
			Query q = em.createNamedQuery("User.findByUsername");
			q.setParameter("username", username);
			q.getSingleResult();
		} catch(NoResultException e) {
			return false;
		}
		
		return true;
	}

	public List<User> getAllUsers() throws EJBException {
		return em.createNamedQuery("User.findAll").getResultList();
	}

	public User getSingleUser(String username) throws EJBException {
		Query q = em.createNamedQuery("User.findByUsername");
		q.setParameter("username", username);
		return (User) q.getSingleResult();
	}

	public List<User> getUserList(int currentPage, int recordsPerPage, String keyword) throws EJBException {
		Query q = null;

		if (keyword.isEmpty()) {

			q = em.createNativeQuery("SELECT * FROM classicmodels.users ORDER BY username OFFSET ? LIMIT ?", User.class);

			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, Integer.valueOf(start));
			q.setParameter(2, Integer.valueOf(recordsPerPage));
			
		} else {
			
			q = em.createNativeQuery("SELECT * FROM classicmodels.users WHERE concat(username) LIKE ? ORDER BY customerNumber OFFSET ? LIMIT ?", User.class);
			
			int start = currentPage * recordsPerPage - recordsPerPage;
			q.setParameter(1, "%" + keyword + "%");
			q.setParameter(2, Integer.valueOf(start));
			q.setParameter(3, Integer.valueOf(recordsPerPage));

		}

		return q.getResultList();
	}
	
	public void addUser(String[] datas) throws EJBException {
		
		User u = new User();
		
		int i = 0;
		u.setUsername(datas[i++]);
		u.setPassword(datas[i++]);
		em.persist(u);

	}

	public void updateUser(String[] datas) throws EJBException {
		
		int i = 0;
		User u = getSingleUser(datas[i++]);
		u.setPassword(datas[i++]);
		em.merge(u);

	}

	public void deleteUser(String username) throws EJBException {

		User u = getSingleUser(username);
		em.remove(u);
		
	}
	
}
