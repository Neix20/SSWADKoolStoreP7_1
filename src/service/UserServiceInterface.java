package service;

import java.util.List;

import javax.ejb.EJBException;

import domain.User;

public interface UserServiceInterface {
	
	public boolean checkPassword(String username, String password);

	public boolean isDuplicated(String username);

	public List<User> getAllUsers() throws EJBException;

	public User getSingleUser(String username) throws EJBException;

	public List<User> getUserList(int currentPage, int recordsPerPage, String keyword) throws EJBException;

	public void addUser(String[] datas) throws EJBException;

	public void updateUser(String[] datas) throws EJBException;

	public void deleteUser(String username) throws EJBException;
}
