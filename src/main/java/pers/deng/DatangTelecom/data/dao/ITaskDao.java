package pers.deng.DatangTelecom.data.dao;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Repository;
import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.bean.Plan;
import pers.deng.DatangTelecom.data.bean.Task;
import pers.deng.DatangTelecom.data.util.DBUtil;

public interface ITaskDao {
	
	/**
	 * �������ܲ�ѯ��Ա������������
	 */
	public int queryTaskCountByEmpId(Employee emp);
	/**
	 * ����Ա����ѯ������Ϊ�����Ƶ�����
	 * @param
	 * @return
	 */
	public List<Task> byEIdQueryTask(Map<String, Object> map);
	
	/*
	 * ���������Ų�ѯ�ƻ�����
	 */
	
	public int GroupQueryPlanCountByTaskId(Map<String, Object> map);

	public int queryPlanCountByTaskId(Task task);
	/**
	 * ��ѯ�����µ����мƻ�
	 */
	public List<Plan> queryPlanByTaskId(Map<String, Object> map);
	
	/**
	 * ���������Ų�ѯ����
	 */
	public Task queryTaskById(Task task);
	
	
	
	
	/**
	 * �����ƶ��˲���������
	 */
	public int queryTaskCountByAssigner(Task task);
	
	/**
	 * �����ƶ��˲�ѯ����
	 */
	public List<Task> queryTaskByAssigner(Map<String, Object> map);
	
	/**
	 * �½�����
	 */
	public int managerNewTask(Task task);
	/**
	 * ���ݱ��ɾ������
	 */
	public int managerDeleteTask(String[] taskids);

	public int managerDeleteplan(String[] taskids);

	/**
	 * ������޸�����
	 */
	public int managerUpdateTaskbyId(Task task);
	
	/**
	 * �޸�����״̬
	 */
	
	public int managerUpdateTaskStatus(Task task);
}
