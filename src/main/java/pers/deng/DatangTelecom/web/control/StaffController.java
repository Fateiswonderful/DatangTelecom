package pers.deng.DatangTelecom.web.control;

import java.awt.Panel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import pers.deng.DatangTelecom.service.Impl.TaskServiceImpl;
import pers.deng.DatangTelecom.web.util.PageBean;
import pers.deng.DatangTelecom.web.util.StaffFrom;

@Controller
public class StaffController {
	
	@Resource(name="taskService")
	TaskServiceImpl taskServ;
	@Resource(name="empService")
	IEmployeeService empServ;
	@Resource(name="planService")
	IPlanService planServ;
	
	
	@RequestMapping("queryTaskByEmpId.do")//�����û���ѯ����Ӧ������
	public ModelAndView queryTaskByEmpId(HttpSession session,HttpServletRequest request,@ModelAttribute("emp")Employee emp){
		ModelAndView mv=new ModelAndView();
		
		
		
		String No=request.getParameter("pageNo");
		PageBean<StaffFrom>pb=new PageBean<StaffFrom>();
		int pageNo=1;//ҳ��
		int pageSize=4;//ҳ��С
		if(No!=null){
			pageNo=Integer.parseInt(No);//���������ҳ��
		}
		List<Task>tas=taskServ.returnQueryTaskByEmpId(emp,pageNo,pageSize);//��ѯ��Ӧ������
		List<StaffFrom> sffs=new ArrayList<StaffFrom>();//�����Ӧ�ƻ�
		if(tas.size()>0){
			for (int i = 0; i < tas.size(); i++) {
				StaffFrom sff=new StaffFrom();//ҳ�湤����
				
				sff.setTask(tas.get(i));
				Employee queryDes=new Employee();
				queryDes.setEmployee_Id(tas.get(i).getAssigner_Id());
				Employee designer=empServ.returnAdminQueryByid(queryDes);//���ݷ�����id��ѯ������
				Task task=new Task();
				task.setTask_Id(tas.get(i).getTask_Id());
				List<Plan> plans=taskServ.returnPlanByTaskId(task,pageNo,9999);
				sff.setEmp(designer);
				sff.setPlans(plans);//���ø������µ����мƻ�
				sffs.add(sff);
			}
			mv.setViewName("redirect:person/task.jsp");//�����ҵ�����
		}else{
			session.setAttribute("mess", "��Ա��û������");
			mv.setViewName("redirect:error.jsp");
		}
		pb.setData(sffs);
		pb.setRecordCount(taskServ.queryTaskCountByEmpId(emp));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		session.setAttribute("pb", pb);
		
		
		return mv;
	}
	
	@RequestMapping("queryTaskById.do")//����id��ѯ����
	public ModelAndView queryTaskById(HttpSession session,HttpServletRequest request,@ModelAttribute("task")Task task){
		ModelAndView mv=new ModelAndView();
		
		String No=request.getParameter("pageNo");
		PageBean<StaffFrom>pb=new PageBean<StaffFrom>();
		int pageNo=1;//ҳ��
		int pageSize=4;//ҳ��С
		if(No!=null){
			pageNo=Integer.parseInt(No);//���������ҳ��
		}
		
		StaffFrom sff=new StaffFrom();
		Task ta=taskServ.returnQueryTaskById(task);
		sff.setTask(ta);//��ѯ��Ӧ������
		Employee emp=new Employee();
		emp.setEmployee_Id(ta.getImplementor_Id());//����ʵʩ��id
		sff.setEmp(empServ.returnAdminQueryByid(emp));//��ѯ����ʵʩ��
		sff.setPlans(taskServ.returnPlanByTaskId(task,pageNo,pageSize));//��ѯ�����µ����мƻ�
		mv.setViewName("redirect:person/taskview.jsp");//���ؼƻ�����
		
		pb.setData1(sff);
		pb.setRecordCount(taskServ.queryPlanCountByTaskId(task));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		
		session.setAttribute("pb", pb);
		return mv;
	}
	
	
	@RequestMapping("deletePlanById.do")//ɾ���ƻ�
	public ModelAndView deletePlanById(HttpSession session,@ModelAttribute("plan")Plan plan){
		ModelAndView mv=new ModelAndView();
		int count=planServ.returnDeletePlanById(plan);
		if(count>0){
			StaffFrom sff=(StaffFrom) session.getAttribute("sff");
			Task ta=new Task();
			ta.setTask_Id(plan.getTask_Id());
			sff.setPlans(taskServ.returnPlanByTaskId(ta,1,9999));
			session.setAttribute("sff", sff);
			mv.setViewName("redirect:person/taskview.jsp");//���ؼƻ�����
		}else{
			session.setAttribute("mess", "�ƻ�ɾ��ʧ��");
			mv.setViewName("redirect:error.jsp");
		}
		return mv;
	}
	@RequestMapping("insertPlan.do")//�½��ƻ�
	public ModelAndView insertPlan(HttpSession session,@ModelAttribute("plan")Plan plan){
		ModelAndView mv=new ModelAndView();
		int count=planServ.returnInsertPlan(plan);
		if(count>0){
			StaffFrom sff=(StaffFrom) session.getAttribute("sff");
			Task ta=new Task();
			ta.setTask_Id(plan.getTask_Id());
			sff.setPlans(taskServ.returnPlanByTaskId(ta,1,9999));
			session.setAttribute("sff", sff);
			mv.setViewName("redirect:person/taskview.jsp");//���ؼƻ�����
		}else{
			session.setAttribute("mess", "�ƻ�ɾ��ʧ��");
			mv.setViewName("redirect:error.jsp");
		}
		return mv;
	}
	
	@RequestMapping("queryPlanByTaskIdByEmpId.do")//�߼���ѯ�ƻ�
	public ModelAndView queryPlanByTaskIdByEmpId(HttpSession session,HttpServletRequest request,@ModelAttribute("plan")Plan plan,@RequestParam("implementor_Id")int impID){
		ModelAndView mv=new ModelAndView();
		

		String No=request.getParameter("pageNo");
		PageBean<Plan>pb=new PageBean<Plan>();
		int pageNo=1;//ҳ��
		int pageSize=2;//ҳ��С
		if(No!=null){
			pageNo=Integer.parseInt(No);//���������ҳ��
		}
		System.out.println("����"+plan.getPlan_Name());
		
		if(plan.getPlan_Name()!=null){
			System.out.println("������");
			session.setAttribute("plan",plan);
		}else{
			if(session.getAttribute("plan")!=null){//�����Ϊ�գ������������
				System.out.println("û����");
				plan=(Plan)session.getAttribute("plan");
			};
		}
		
		Task task=new Task();
		task.setImplementor_Id(impID);//����ʵʩ��ID
		
		List<Plan> plans=planServ.returnQueryPlanByTaskIdByEmpId(task,plan,pageNo,pageSize);//����������ѯʵʩ�������еļƻ�
		
		Employee emp=new Employee();
		emp.setEmployee_Id(task.getImplementor_Id());
		System.out.println("ʵʩ��:"+emp.getEmployee_Id());
		List<Task>tas=taskServ.returnQueryTaskByEmpId(emp,pageNo,9999);//��ѯʵʩ�������е�����
		Map<Integer,Object> ts=new HashMap<Integer, Object>();
		for (int i = 0; i < tas.size(); i++) {
			Task ta= tas.get(i);
			ts.put(ta.getTask_Id(),ta);
		}
		
		
		session.setAttribute("tas", ts);
		
		
		pb.setData(plans);
		
		pb.setRecordCount(taskServ.GroupQueryueryPlanCountByTaskId(task, plan));
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		session.setAttribute("pb", pb);
		
		mv.setViewName("redirect:person/checkpro.jsp");//���ظ߼���ѯ�ƻ�ҳ��
		
		return mv;
	}
	
	@RequestMapping("queryPlanByPlanId.do")//����Ų�ѯ�ƻ�
	public ModelAndView queryPlanByPlanId(HttpSession session,@ModelAttribute("plan")Plan plan){
		ModelAndView mv=new ModelAndView();
		Plan pl=planServ.returnQueryPlanByPlanId(plan);
		session.setAttribute("PlanByPlanId", pl);
		mv.setViewName("redirect:person/feedback.jsp");//���ؼƻ�����ҳ��
		return mv;
	}
	@RequestMapping("updatePlanStateByPlanId.do")//������޸ļƻ�״̬
	public ModelAndView updatePlanStateByPlanId(HttpSession session,@ModelAttribute("plan")Plan plan){
		ModelAndView mv=new ModelAndView();
		int count=planServ.returnUpdatePlanStateByPlanId(plan);//����޸ĳɹ�
		if(count>0){
			Plan pl=planServ.returnQueryPlanByPlanId(plan);
			session.setAttribute("PlanByPlanId", pl);
			mv.setViewName("redirect:person/task.jsp");//���ؼƻ�����ҳ��
		}else{
			session.setAttribute("mess", "�ƻ��޸�ʧ��");
			mv.setViewName("redirect:error.jsp");
		}
		return mv;
	}
}
