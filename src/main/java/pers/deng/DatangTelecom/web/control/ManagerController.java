package pers.deng.DatangTelecom.web.control;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.bean.Plan;
import pers.deng.DatangTelecom.data.bean.Task;
import pers.deng.DatangTelecom.service.IEmployeeService;
import pers.deng.DatangTelecom.service.IPlanService;
import pers.deng.DatangTelecom.service.ITaskService;
import pers.deng.DatangTelecom.web.util.PageBean;
import pers.deng.DatangTelecom.web.util.StaffFrom;

@Controller
public class ManagerController {
	@Resource(name="empService")
	IEmployeeService empServ;
	@Resource(name="planService")
	IPlanService planServ;
	@Resource(name="taskService")
	ITaskService taskServ;
	
	@RequestMapping("queryTaskByAssigner.do")//按制定人查询任务
	public ModelAndView queryTaskByAssigner(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		String No=request.getParameter("pageNo");
		PageBean<StaffFrom>pb=new PageBean<StaffFrom>();
		int pageNo=1;//页码
		int pageSize=4;//页大小
		if(No!=null){
			pageNo=Integer.parseInt(No);//如果传递了页码
		}
		
		List<StaffFrom> sffs=new ArrayList<StaffFrom>();//任务对应员工对象
		List<Task>tas=taskServ.returnQueryTaskByAssigner(task,pageNo,pageSize);
		
		for (int i = 0; i < tas.size(); i++) {
			StaffFrom sff=new StaffFrom();
			Employee emp=new Employee();
			emp.setEmployee_Id(tas.get(i).getImplementor_Id());//设置实施人id查询实施人
			sff.setTask(tas.get(i));//添加任务
			sff.setEmp(empServ.returnAdminQueryByid(emp));//添加实施人进页面显示工具类
			task.setTask_Id(tas.get(i).getTask_Id());//设置任务id
			sff.setPlans(taskServ.returnPlanByTaskId(task,1,2));//查询任务下的所有计划
			sffs.add(sff);
		}
		pb.setRecordCount(taskServ.returnQueryTaskCountByAssigner(task));//设置记录总数
		pb.setData(sffs);
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		
		session.setAttribute("pb", pb);
		
		
		mv.setViewName("redirect:manager/taskview.jsp");//返回计划反馈页面
		return mv;
	}
	
	
	
	@RequestMapping("managerQueryPlanByTaskId.do")//主管根据任务Id查询计划
	public ModelAndView managerQueryPlanByTaskId(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		StaffFrom sff=new StaffFrom();
		String No=request.getParameter("pageNo");
		PageBean<StaffFrom>pb=new PageBean<StaffFrom>();
		int pageNo=1;//页码
		int pageSize=4;//页大小
		if(No!=null){
			pageNo=Integer.parseInt(No);//如果传递了页码
		}
		Task managerQueryTask=taskServ.returnQueryTaskById(task);
		sff.setTask(managerQueryTask);
		Employee emp=new Employee();//设置实施人id
		emp.setEmployee_Id(managerQueryTask.getImplementor_Id());
		sff.setEmp(empServ.returnAdminQueryByid(emp));
		
		sff.setPlans(taskServ.returnPlanByTaskId(managerQueryTask,pageNo,pageSize));//设置任务下的所有计划
		
		pb.setRecordCount(taskServ.queryPlanCountByTaskId(task));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		pb.setData1(sff);
		session.setAttribute("pb", pb);
		
		mv.setViewName("redirect:manager/taskparticular.jsp");
		return mv;
	}
	
	@RequestMapping("managerQueryPlanByPlanId.do")//主管根据计划编号查询计划
	public ModelAndView managerQueryPlanByPlanId(HttpSession session,@ModelAttribute("plan")Plan plan){
		ModelAndView mv=new ModelAndView();
		Plan managerQueryPlanById= planServ.returnQueryPlanByPlanId(plan);
		session.setAttribute("managerQueryPlanById", managerQueryPlanById);
		System.out.println("对象:"+managerQueryPlanById.toString());
		mv.setViewName("redirect:manager/program.jsp");
		return mv;
	}
	
	@RequestMapping("managerQueryStaff.do")//主管查询下属员工
	public ModelAndView managerQueryStaff(HttpSession session,@ModelAttribute("emp")Employee emp){
		ModelAndView mv=new ModelAndView();
		List<Employee> managerQueryStaff=empServ.returnStaffByManagerId(emp,1,9999);

		session.setAttribute("managerQueryStaff", managerQueryStaff);
		mv.setViewName("redirect:manager/task.jsp");
		return mv;
	}
	
	@RequestMapping("managerNewTask.do")//主管根据计划编号查询计划
	public ModelAndView managerNewTask(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		int count=taskServ.returnManagerNewTask(task);
		if(count>0){
			this.queryTaskByAssigner(session,request, task);//跳转到所有任务
			mv.setViewName("redirect:manager/taskview.jsp");
		}else{
			session.setAttribute("mess", "制定新任务失败");
			mv.setViewName("redirect:error.jsp");
		}
		return mv;
	}
	
	@RequestMapping("queryDeleteTaskByAssigner.do")//按制定人查询删除任务列表
	public ModelAndView queryDeleteTaskByAssigner(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		String No=request.getParameter("pageNo");
		PageBean<StaffFrom>pb=new PageBean<StaffFrom>();
		int pageNo=1;//页码
		int pageSize=4;//页大小
		if(No!=null){
			pageNo=Integer.parseInt(No);//如果传递了页码
		}
		List<StaffFrom> sffs=new ArrayList<StaffFrom>();//任务对应员工对象
		List<Task>tas=taskServ.returnQueryTaskByAssigner(task,pageNo,pageSize);
		for (int i = 0; i < tas.size(); i++) {
			StaffFrom sff=new StaffFrom();
			Employee emp=new Employee();
			emp.setEmployee_Id(tas.get(i).getImplementor_Id());//设置实施人id查询实施人
			sff.setTask(tas.get(i));//添加任务
			sff.setEmp(empServ.returnAdminQueryByid(emp));//添加实施人进页面显示工具类
			
			task.setTask_Id(tas.get(i).getTask_Id());//设置任务id
			sffs.add(sff);
		}
		pb.setData(sffs);
		pb.setRecordCount(taskServ.returnQueryTaskCountByAssigner(task));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		session.setAttribute("pb", pb);
		
		mv.setViewName("redirect:manager/taskundone.jsp");//返回计划反馈页面
		return mv;
	}
	
	@RequestMapping("queryDeleteTaskByTaskId.do")//按制定人查询删除任务列表
	public ModelAndView queryDeleteTaskByTaskId(HttpSession session,HttpServletRequest request,@RequestParam("taskids")String[] taskids,
			@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		int count=taskServ.returnManagerDeleteTask(taskids);
		System.out.println("控制器删除任务数目:"+count);
		if(count>0){
			this.queryTaskByAssigner(session,request, task);//跳转到所有任务
			mv.setViewName("redirect:manager/taskundone.jsp");
		}else{
			session.setAttribute("mess", "删除任务中出现了错误");
			mv.setViewName("refirect:error.jsp");
		}
		return mv;
	}
	
	@RequestMapping("managerQueryTaskGOUpdate.do")//主管根据id查询任务
	public ModelAndView managerQueryStaffGOUpdate(HttpSession session,@ModelAttribute("task")Task task,
			@ModelAttribute("emp")Employee emp){
		ModelAndView mv=new ModelAndView();
		List<Employee> managerQueryStaff=empServ.returnStaffByManagerId(emp,1,99999);//
		Task ta=taskServ.returnQueryTaskById(task);
		session.setAttribute("managerQueryStaff", managerQueryStaff);//保存所有的下属员工
		session.setAttribute("managerQueryTask", ta);//保存任务
		mv.setViewName("redirect:manager/adjust.jsp");
		return mv;
	}
	@RequestMapping("managerUpdateTaskById.do")//按制定人查询删除任务列表
	public ModelAndView managerUpdateTaskById(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		int count=taskServ.returnManagerUpdateTaskByid(task);
		if(count>0){
			this.queryDeleteTaskByAssigner(session,request, task);//跳转到所有任务
			mv.setViewName("redirect:manager/taskundone.jsp");
		}else{
			mv.setViewName("redirect:error.jsp");
			session.setAttribute("mess", "主管修改任务信息出错了!");
		}
		return mv;
	}
	
	@RequestMapping("managerQueryStaffList.do")//主管查询下属员工
	public ModelAndView managerQueryStaffList(HttpSession session,HttpServletRequest request,@ModelAttribute("emp")Employee emp){
		ModelAndView mv=new ModelAndView();

		String No=request.getParameter("pageNo");
		PageBean<Employee>pb=new PageBean<Employee>();
		int pageNo=1;//页码
		int pageSize=4;//页大小
		if(No!=null){
			pageNo=Integer.parseInt(No);//如果传递了页码
		}
		List<Employee> managerQueryStaff=empServ.returnStaffByManagerId(emp,pageNo,pageSize);
		
		pb.setData(managerQueryStaff);
		pb.setRecordCount(empServ.returnStaffCountByManagerId(emp));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		mv.setViewName("redirect:manager/checkper.jsp");
		
		session.setAttribute("pb", pb);
		return mv;
	}
	
	@RequestMapping("managerQueryStaffByStaffId.do")//主管查询单个员工详细信息
	public ModelAndView managerQueryStaffByStaffId(HttpSession session,@ModelAttribute("emp")Employee emp){
		ModelAndView mv=new ModelAndView();
		Employee managerQueryStaff=empServ.returnAdminQueryByid(emp);
		session.setAttribute("managerQueryStaffByStaffId", managerQueryStaff);
		System.out.println("单个用户员工:"+managerQueryStaff.toString());
		mv.setViewName("redirect:manager/personinfo.jsp");
		return mv;
	}
	
	@RequestMapping("trackingTaskList.do")//主管点击跟踪任务
	public ModelAndView trackingTaskList(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		String No=request.getParameter("pageNo");
		PageBean<StaffFrom>pb=new PageBean<StaffFrom>();
		int pageNo=1;//页码
		int pageSize=4;//页大小
		if(No!=null){
			pageNo=Integer.parseInt(No);//如果传递了页码
		}
		List<Task>tas=taskServ.returnQueryTaskByAssigner(task,pageNo,pageSize);
		
		List<StaffFrom> sffs=new ArrayList<StaffFrom>();
		for (int i = 0; i < tas.size(); i++) {
			StaffFrom sff=new StaffFrom();
			sff.setTask(tas.get(i));
			Employee emp=new Employee();
			emp.setEmployee_Id(tas.get(i).getImplementor_Id());//获取实施人id查询实施人
			sff.setEmp(empServ.returnAdminQueryByid(emp));
			sffs.add(sff);
		}
		
		pb.setData(sffs);
		pb.setRecordCount(taskServ.returnQueryTaskCountByAssigner(task));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		
		session.setAttribute("pb",pb);
		
		mv.setViewName("redirect:manager/intendance.jsp");
		return mv;
	}
	
	@RequestMapping("trackingTaskByTaskId.do")//主管在跟踪任务点击任务详细
	public ModelAndView trackingTaskByTaskId(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		StaffFrom sff=new StaffFrom();
		String No=request.getParameter("pageNo");
		PageBean<StaffFrom>pb=new PageBean<StaffFrom>();
		int pageNo=1;//页码
		int pageSize=4;//页大小
		if(No!=null){
			pageNo=Integer.parseInt(No);//如果传递了页码
		}
		Task managerQueryTask=taskServ.returnQueryTaskById(task);
		sff.setTask(managerQueryTask);
		Employee emp=new Employee();//设置实施人id
		emp.setEmployee_Id(managerQueryTask.getImplementor_Id());
		sff.setEmp(empServ.returnAdminQueryByid(emp));
		sff.setPlans(taskServ.returnPlanByTaskId(managerQueryTask,pageNo,pageSize));//设置任务下的所有计划
		pb.setData1(sff);
		pb.setRecordCount(taskServ.queryPlanCountByTaskId(task));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		session.setAttribute("pb", pb);
		mv.setViewName("redirect:manager/programinten.jsp");
		return mv;
	}
	
	@RequestMapping("checkboxPlan.do")//根据复选框选中是否显示计划
	public ModelAndView checkboxPlan(HttpSession session,@RequestParam("plan_id")String[] taskids){
		ModelAndView mv=new ModelAndView();
		PageBean<StaffFrom>pb=(PageBean<StaffFrom>) session.getAttribute("pb");
		StaffFrom sff= pb.getData1();
		List<Plan>plans=new ArrayList<Plan>();
		System.out.println("传递数组"+taskids.toString());
		for (int i = 0; i <taskids.length; i++) {
			for (int j = 0; j <sff.getPlans().size() ; j++) {
				if(sff.getPlans().get(j).getPlan_Id()==Integer.parseInt(taskids[i])){
					plans.add(sff.getPlans().get(j));
				}
			}
		}
		pb.setData1(sff);
		pb.setRecordCount(taskids.length);
		System.out.println("传递的id"+taskids.toString());
		System.out.println("保存的:"+plans.toString());
		sff.setPlans(plans);
		session.setAttribute("pb", pb);
		mv.setViewName("redirect:manager/programinten.jsp");
		return mv;
	}
	@RequestMapping("managerUpdateStatus.do")//主管修改任务状态
	public ModelAndView checkboxPlan(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		int count=taskServ.returnManagerUpdateStatus(task);
		
		if(count>0){
			this.trackingTaskList(session,request, task);//调用主管点击任务跟踪的方法
			mv.setViewName("redirect:manager/intendance.jsp");
		}else{
			session.setAttribute("mess", "主管修改任务状态出错");
			mv.setViewName("redirect:error.jsp");
		}
		return mv;
	}
	
}
