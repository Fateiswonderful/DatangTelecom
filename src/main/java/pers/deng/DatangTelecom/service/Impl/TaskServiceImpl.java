package pers.deng.DatangTelecom.service.Impl;

import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.bean.Plan;
import pers.deng.DatangTelecom.data.bean.Task;
import pers.deng.DatangTelecom.data.dao.ITaskDao;

import pers.deng.DatangTelecom.service.ITaskService;

@Service("taskService")
public class TaskServiceImpl implements ITaskService {
	
	@Autowired
	ITaskDao taskDao;


	Map<String,Object>map=new HashMap<String, Object>();

	@Override
	public List<Task> returnQueryTaskByEmpId(Employee emp,int pageNo,int pageSize) {

		int start=(pageNo-1)*pageSize+1;
		int end=pageNo*pageSize;
		map.put("end",end);
		map.put("emp",emp);
		map.put("start",start);

		return taskDao.byEIdQueryTask(map);
	}
	@Override
	public int queryPlanCountByTaskId(Task task) {
		return taskDao.queryPlanCountByTaskId(task);
	}
	@Override
	public List<Plan> returnPlanByTaskId(Task task,int pageNo,int pageSize) {

		int start=(pageNo-1)*pageSize+1;
		int end=pageNo*pageSize;
		map.put("task",task);
		map.put("start",start);
		map.put("end",end);
		return taskDao.queryPlanByTaskId(map);
	}

	@Override
	public Task returnQueryTaskById(Task task) {
		return taskDao.queryTaskById(task);
	}
	@Override
	public int returnQueryTaskCountByAssigner(Task task) {
		return taskDao.queryTaskCountByAssigner(task);
	}
	@Override
	public List<Task> returnQueryTaskByAssigner(Task task,int pageNo,int pageSize) {
		int start=(pageNo-1)*pageSize+1;
		int end=pageNo*pageSize;
		map.put("task",task);
		map.put("start",start);
		map.put("end",end);
		return taskDao.queryTaskByAssigner(map);
	}

	@Override
	public int returnManagerNewTask(Task task) {
		return taskDao.managerNewTask(task);
	}

	@Override
	public int returnManagerDeleteTask(String[] taskids) {

		int count=0;
		for (String tid : taskids) {//删除任务对应的计划
			taskDao.managerDeleteplan(taskids);
		}

		for (int i = 0; i < taskids.length; i++) {//删除任务
			count+=taskDao.managerDeleteTask(taskids);
		}

		if(count==taskids.length){
			return 1;//如果删除成功的数据等于任务id数则成功
		}
		return 0;

	}

	@Override
	public int returnManagerUpdateTaskByid(Task task) {
		// TODO Auto-generated method stub
		return taskDao.managerUpdateTaskbyId(task);
	}

	@Override
	public int returnManagerUpdateStatus(Task task) {
		return taskDao.managerUpdateTaskStatus(task);
	}
	@Override
	public int queryTaskCountByEmpId(Employee emp) {
		// TODO Auto-generated method stub
		return taskDao.queryTaskCountByEmpId(emp);
	}
	@Override
	public int GroupQueryueryPlanCountByTaskId(Task task, Plan plan) {
		map.put("task",task);
		map.put("plan",plan);
		return taskDao.GroupQueryPlanCountByTaskId(map);
	}
	
	

	

	
	
	

}
