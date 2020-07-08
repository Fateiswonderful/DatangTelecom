package pers.deng.DatangTelecom.service;

import java.util.List;

import pers.deng.DatangTelecom.data.bean.Plan;
import pers.deng.DatangTelecom.data.bean.Task;



public interface IPlanService {

	
	/**
	 * ���ڷ��ذ����ɾ���ƻ��Ľ��
	 */
	public int returnDeletePlanById(Plan plan);
	
	/**
	 * ������Ӽƻ�
	 */
	public int returnInsertPlan(Plan plan);
	
	/**
	 * ���ڷ��ظ���ʵʩ�˲�ѯ�����мƻ�
	 */
	public List<Plan>returnQueryPlanByTaskIdByEmpId(Task task, Plan plan, int pageNo, int pageSize);
	
	/**
	 * ���ذ��ƻ���Ų�ѯ�ļƻ�
	 */
	public Plan returnQueryPlanByPlanId(Plan plan);
	/**
	 * �����޸ļƻ�״̬�Ľ��
	 */
	public int returnUpdatePlanStateByPlanId(Plan plan);
}
