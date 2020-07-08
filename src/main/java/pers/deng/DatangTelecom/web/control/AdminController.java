package pers.deng.DatangTelecom.web.control;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.bean.Role;
import pers.deng.DatangTelecom.service.IEmployeeService;
import pers.deng.DatangTelecom.service.Impl.EmployeeServiceImpl;
import pers.deng.DatangTelecom.web.util.PageBean;

@Controller
public class AdminController {
	@Resource(name="empService")
	IEmployeeService empServ;
	
	
	public ModelAndView loadAllEmp(HttpSession session,HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		String No=request.getParameter("pageNo");
		PageBean<Employee>pb=new PageBean<Employee>();
		int pageNo=1;//ҳ��
		int pageSize=4;//ҳ��С
		if(No!=null){
			pageNo=Integer.parseInt(No);//���������ҳ��
		}
		List<Employee>emps=empServ.returnAllEmp(pageNo,pageSize);
		
		pb.setRecordCount(empServ.returnRecordCount());
		pb.setPageNo(pageNo);
		pb.setPageSize(pageSize);
		pb.setData(emps);
		session.setAttribute("adminQueryEmpPb",pb);
		System.out.println(session.getAttribute("adminQueryEmpPb"));
		return mv;
	}
	
	@RequestMapping("queryAllEmp.do")//����ȫ���û�����
	public ModelAndView queryAllEmp(HttpServletRequest request,HttpSession session){
		ModelAndView mv=this.loadAllEmp(session, request);
		mv.setViewName("redirect:admin/useradmin.jsp");
		return mv;
	}
	
	
	@RequestMapping("EmpStaffLoad.do")//����Ա������ȫ��
	public ModelAndView empLoad(HttpServletRequest request,HttpSession session){
		ModelAndView mv=this.loadAllEmp(session, request);
		mv.setViewName("redirect:admin/empadmin.jsp");
		return mv;
	}
	
	
	@RequestMapping("empAllotLoad.do")//������Աȫ������
	public ModelAndView emp(HttpServletRequest request,HttpSession session){
		ModelAndView mv=this.loadAllEmp(session, request);
		mv.setViewName("redirect:admin/empdistribute.jsp");
		return mv;
	}
	
	@RequestMapping("adminAddEmp.do")//����Ա����û�
	public ModelAndView adminAddEmp(@ModelAttribute("emp")Employee emp,@RequestParam("role_Id")int roleID,HttpSession session){
		ModelAndView mv=new ModelAndView();
		Role r=new Role();
		r.setRole_Id(roleID);
		emp.setRole(r);
		System.out.println("����û�:"+emp);
		int count=empServ.returnAdminAddEmpResult(emp);
		
		if(count>0){
			mv.setViewName("queryAllEmp.do");
		}else{
			session.setAttribute("mess", "���ʧ��");
			mv.setViewName("redirect:login_error.do");
		}
		return mv;
	}
	
	@RequestMapping("adminDeleteEmp.do")//����Աɾ���û�
	public ModelAndView adminAddEmp(@ModelAttribute("emp")Employee emp,HttpSession session){
		ModelAndView mv=new ModelAndView();
		int count=empServ.returnAdminDeleteEmpResult(emp);
		if(count>0){
			mv.setViewName("redirect:EmpStaffLoad.do");
		}else{
			mv.setViewName("redirect:error.jsp");
			session.setAttribute("mess", "ɾ��ʧ��");
		}
		return mv;
	}
		
	@RequestMapping("adminAllocationEmp.do")//��ѯ�����û�������������
	public ModelAndView adminAllocationEmp(@ModelAttribute("emp")Employee emp,HttpSession session){
		ModelAndView mv=new ModelAndView();
		List<Employee>emps=empServ.returnManager();
		Employee queryEmp=empServ.returnAdminQueryByid(emp);
		
		
		System.out.println("ȫ������:"+emps);
		System.out.println("�޸��û�:"+queryEmp);
		if(queryEmp!=null){
			mv.setViewName("redirect:admin/persondesc.jsp");
			session.setAttribute("managers", emps);
			session.setAttribute("queryEmpById", queryEmp);
		}else{
			session.setAttribute("mess", "δ�ҵ���������Ա");
			mv.setViewName("redirect:error.jsp");
		}
		return mv;
	}
	
	@RequestMapping("allocationStaff.do")
	public ModelAndView allocationStaff(@ModelAttribute("emp")Employee emp,HttpSession session){
		ModelAndView mv=new ModelAndView();
		int count=empServ.returnAllocation(emp.getParent_Id(),emp.getEmployee_Id());
		if(count>0){
			mv.setViewName("redirect:admin/empdistribute.jsp");
		}else{
			session.setAttribute("mess", "����ʧ��");
			mv.setViewName("redirect:error.jsp");
		}
		return mv;
	}
	
}
