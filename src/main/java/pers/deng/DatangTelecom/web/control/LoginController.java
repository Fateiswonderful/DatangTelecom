package pers.deng.DatangTelecom.web.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pers.deng.DatangTelecom.data.bean.Employee;
import pers.deng.DatangTelecom.data.dao.ITaskDao;
import pers.deng.DatangTelecom.service.IEmployeeService;
import pers.deng.DatangTelecom.service.Impl.EmployeeServiceImpl;

@Controller
public class LoginController {
	@Resource(name="empService")
	IEmployeeService empServ;
	
	
	/**
	 * 登录
	 * @param emp
	 * @param session
	 * @return
	 */
	@RequestMapping(value="stafflogin.do",method=RequestMethod.POST)
	public ModelAndView StaffLogin(Employee emp,HttpSession session){
		ModelAndView mv=new ModelAndView();
		
		Employee empLogin=empServ.returnEmpLoginResult(emp);
		if(empLogin!=null){
			switch (empLogin.getRole().getRole_Id()) {
			case 1:
				mv.setViewName("redirect:admin/welcome.jsp");
				break;
			case 2:
				mv.setViewName("redirect:manager/welcome.jsp");
				break;
			case 3:
				mv.setViewName("redirect:person/welcome.jsp");
				break;
			default:
				mv.setViewName("redirect:login_error.do");
				session.setAttribute("mess", "角色信息不匹配");
				break;
			}
			session.setAttribute("empLogin", empLogin);//登录对象存入会话
		}else{
			
			session.setAttribute("mess", "账户登录失败");
			mv.setViewName("redirect:error.jsp");
		}
		System.out.println("登录对象:"+empLogin);
		return mv;
	}
	
	/**
	 * 注销
	 * @param session
	 * @return
	 */
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session){
		ModelAndView mv=new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:login.jsp");
		return mv;
	}
	
	
	
	
}
