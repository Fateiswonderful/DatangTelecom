package pers.deng.DatangTelecom.web.util;

import java.util.List;

import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.bean.Plan;
import pers.deng.DatangTelecom.data.bean.Task;

public class StaffFrom {
	private Employee emp;//第二部根据任务中的分配人ID查询分配人信息
	
	private Task task;//第一步查出实施人的一条任务
	
	private List<Plan> plans;//第三步根据任务中的任务ID查询任务下的所有计划
	
	
	
	public StaffFrom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StaffFrom(Employee emp, Task task, List<Plan> plans) {
		super();
		this.emp = emp;
		this.task = task;
		this.plans = plans;
	}
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public List<Plan> getPlans() {
		return plans;
	}
	public void setPlans(List<Plan> plans) {
		this.plans = plans;
	}
	
	
	
	
	
	
}
