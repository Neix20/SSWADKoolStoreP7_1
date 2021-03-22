package service;

import java.util.List;

import javax.ejb.EJBException;

import domain.Customer;

public interface CustomerServiceInterface {

	public List<Customer> getAllCustomers() throws EJBException;

	public Customer getSingleCustomer(String customerNumber) throws EJBException;

	public List<Customer> getTargetCustomers(int currentPage, int recordsPerPage, String keyword);

	public void addCustomer(String[] datas) throws EJBException;

	public void updateCustomer(String[] datas) throws EJBException;

	public void deleteCustomer(String customerNumber) throws EJBException;
}
