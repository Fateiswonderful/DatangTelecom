package pers.deng.DatangTelecom.data.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import pers.deng.DatangTelecom.data.bean.Employee;




public interface IEmployeeDao {
	/**
	 * ��¼�ķ���
	 * @param emp
	 * @return
	 */
	public Employee Stafflogin(Employee emp);
	/**
	 * ��ѯ����Ա���ķ���
	 * @return
	 */
	public List<Employee> queryAllEmp(Map<String, Integer> map);
	
	/**
	 * ��ѯ��¼����
	 */
	public int queryRecordCount();
	
	
	/**
	 * ϵͳ����Ա����û�
	 */
	public int adminAddEmp(Employee emp);
	
	/**
	 * ϵͳ����Աɾ���û�
	 */
	public int adminDeleteEmp(Employee emp);
	
	/**
	 * ����Ų�ѯ����Ա��
	 */
	public Employee adminQueryEmpByID(Employee emp);
	
	/**
	 * ��ѯ��������
	 */
	public List<Employee> queryManager();
	
	/**
	 * ��������
	 */
	public int adminAllocation(Map<String, Integer> map);
	/**
	 * ��ѯ�����µ�����Ա������
	 */
	public int queryEmpCountByPrantenId(Employee emp);
	
	/**
	 * ��ѯ�����µ�����Ա��
	 */
	public List<Employee> queryEmpByPrantenId(Map<String, Object> map);
}
