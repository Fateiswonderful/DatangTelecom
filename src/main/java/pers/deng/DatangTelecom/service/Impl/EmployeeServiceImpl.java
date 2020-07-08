package pers.deng.DatangTelecom.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.dao.IEmployeeDao;
import pers.deng.DatangTelecom.service.IEmployeeService;


@Service("empService")
public class EmployeeServiceImpl implements IEmployeeService {

	@Autowired
	IEmployeeDao empDao;
	
	
	@Override
	public Employee returnEmpLoginResult(Employee emp) {
		return empDao.Stafflogin(emp);
	}
	
	@Override
	public List<Employee> returnAllEmp(int pageNo,int pageSize) {
		Map<String,Integer>map=new HashMap<String, Integer>();
		int start=(pageNo-1)*pageSize+1;
		int end =pageNo*pageSize;
		map.put("start",start);
		map.put("end",end);
		return empDao.queryAllEmp(map);
	}

	@Override
	public int returnRecordCount() {
		return empDao.queryRecordCount();
	}

	@Override
	public int returnAdminAddEmpResult(Employee emp) {
		return empDao.adminAddEmp(emp);
	}

	@Override
	public int returnAdminDeleteEmpResult(Employee emp) {
		return empDao.adminDeleteEmp(emp);
	}

	@Override
	public Employee returnAdminQueryByid(Employee emp) {
		return empDao.adminQueryEmpByID(emp);
	}

	@Override
	public List<Employee> returnManager() {
		return empDao.queryManager();
	}

	@Override
	public int returnAllocation(int parentId, int allocationId) {
		Map<String,Integer>map=new HashMap<String, Integer>();
		map.put("parentId",parentId);
		map.put("allocationId",allocationId);
		return empDao.adminAllocation(map);
	}

	@Override
	public List<Employee> returnStaffByManagerId(Employee emp,int pageNo,int pageSize) {
		System.out.println("主管id"+emp.getEmployee_Id());
		Map<String,Object>map=new HashMap<String, Object>();
		int start=(pageNo-1)*pageSize+1;
		int end =pageNo*pageSize;
		map.put("start",start);
		map.put("end",end);
		map.put("emp",emp);
		return empDao.queryEmpByPrantenId(map);
	}

	@Override
	public int returnStaffCountByManagerId(Employee emp) {

		return empDao.queryEmpCountByPrantenId(emp);
	}
	
	
}
