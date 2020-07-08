package pers.deng.DatangTelecom.service;

import java.util.List;

import org.springframework.stereotype.Service;

import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.bean.Plan;
import pers.deng.DatangTelecom.data.bean.Task;


public interface ITaskService {

	
	
	public int queryTaskCountByEmpId(Employee emp);
	/**
	 * ���ڷ�������ΪԱ���ƶ�������
	 * @param emp
	 * @return
	 */
	public List<Task> returnQueryTaskByEmpId(Employee emp, int pageNo, int pageSize);
	
	
	
	public int GroupQueryueryPlanCountByTaskId(Task task, Plan plan);
	
	public int queryPlanCountByTaskId(Task task);
	
	/**
	 * ���ڷ������������мƻ�
	 */
	public List<Plan> returnPlanByTaskId(Task task, int pageNo, int pageSize);
	
	
	/**
	 * ���ڷ��ذ���Ų�ѯ������
	 */
	public Task returnQueryTaskById(Task task);
	
	/**
	 * �����ƶ�����������
	 */
	public int returnQueryTaskCountByAssigner(Task task);
	
	/**
	 * ���ڷ����ƶ��˵���������
	 */
	public List<Task> returnQueryTaskByAssigner(Task task, int pageNo, int pageSize);
	
	/**
	 * ���ڷ����½�����Ľ��
	 */
	public int returnManagerNewTask(Task task);
	
	/**
	 * ���ڷ�������ɾ������Ľ��
	 */
	
	public int returnManagerDeleteTask(String[] taskids);
	
	/**
	 * ����id������
	 */
	public int returnManagerUpdateTaskByid(Task task);
	
	/**
	 * �����޸�����״̬
	 */
	public int returnManagerUpdateStatus(Task task);
}
