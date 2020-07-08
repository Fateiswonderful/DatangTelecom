package pers.deng.DatangTelecom.service;

import java.util.List;

import pers.deng.DatangTelecom.data.bean.Employee;

public interface IEmployeeService {
	
	/**
	 * ����Ա����¼����ķ���
	 */
	public Employee returnEmpLoginResult(Employee emp);
	
	/**
	 * ����Ա����¼����
	 */
	public int returnRecordCount();
	
	/**
	 * ���ڷ������е�Ա��
	 */
	public List<Employee> returnAllEmp(int pageNo, int pageSize);
	
	/**
	 * ���ڷ��ع���Ա���Ա�����
	 */
	public int returnAdminAddEmpResult(Employee emp);
	
	
	/**
	 * ���ڷ��ع���Աɾ��Ա���ķ���
	 * 
	 */
	public int returnAdminDeleteEmpResult(Employee emp);
	
	/**
	 * �û����ص���Ա��
	 */
	public Employee returnAdminQueryByid(Employee emp);
	
	/**
	 * ���ڷ�����������
	 */
	public List<Employee>returnManager();
	
	/**
	 * ���ط���Ľ��
	 */
	public int returnAllocation(int parentId, int allocationId);
	/**
	 * �����������е�����Ա��
	 */
	public List<Employee>returnStaffByManagerId(Employee emp, int pageNo, int pageSize);
	/**
	 * �����������е�����Ա������
	 */
	public int returnStaffCountByManagerId(Employee emp);
}
