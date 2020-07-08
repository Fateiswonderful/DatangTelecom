package pers.deng.DatangTelecom.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.deng.DatangTelecom.data.bean.Plan;
import pers.deng.DatangTelecom.data.bean.Task;
import pers.deng.DatangTelecom.data.dao.IPlanDao;
import pers.deng.DatangTelecom.service.IPlanService;
@Service("planService")
public class PlanServiceImpl implements IPlanService {

	@Autowired
	IPlanDao planDao;

	@Override
	public int returnDeletePlanById(Plan plan) {
		return planDao.deletePlanById(plan);
	}
	@Override
	public int returnInsertPlan(Plan plan) {

		return planDao.insertPlan(plan);
	}
	@Override
	public List<Plan> returnQueryPlanByTaskIdByEmpId(Task task,Plan plan,int pageNo,int pageSize) {
		Map<String,Object>map=new HashMap<String, Object>();
		int start=(pageNo-1)*pageSize+1;
		int end=pageNo*pageSize;
		map.put("start",start);
		map.put("end",end);
		map.put("task",task);
		map.put("plan",plan);
		return planDao.queryPlanByTaskIdByEmpId(map);
	}
	@Override
	public Plan returnQueryPlanByPlanId(Plan plan) {
		return planDao.queryPlanByPlanId(plan);
	}
	@Override
	public int returnUpdatePlanStateByPlanId(Plan plan) {
		// TODO Auto-generated method stub
		return planDao.updatePlanStateByPlanId(plan);
	}

}
