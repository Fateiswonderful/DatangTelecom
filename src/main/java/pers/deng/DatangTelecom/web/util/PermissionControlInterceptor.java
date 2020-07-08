package pers.deng.DatangTelecom.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import pers.deng.DatangTelecom.data.bean.Employee;

public class PermissionControlInterceptor implements HandlerInterceptor {
	//login.jsp因为SpringMVC拦截器不会拦截JSP页面，
		//因此login.jsp本身就不会启动权限拦截器
		// 不拦截"/input_login.do"和"/mylogin.do"请求
				private static final String[] IGNORE_URI = 
				{"stafflogin.do"};
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView mv) throws Exception {
		
		HttpSession session=request.getSession();
		
		
		String [] pathJurisdiction=mv.getViewName().split("/");//截取控制器请求，判断是否跨权限操作
		
		
		if(pathJurisdiction[0]!="redirect:login.jsp"){//放开注销，注销之后就没有回话了
			Employee empLogin= (Employee)session .getAttribute("empLogin");
			System.out.println("回来的路径"+mv.getViewName());

			if(empLogin!=null){
				System.out.println("身份编号:"+empLogin.getRole().getRole_Id());

				switch (empLogin.getRole().getRole_Id()) {
				case 1:
					//如果权限对应放开请求
					//如果想跨权限跳转，直接取对应的主页
			
					if(pathJurisdiction[0].equals("redirect:manager")){
						mv.setViewName("redirect:admin/welcome.jsp");
					}else if(pathJurisdiction[0].equals("person")){
						mv.setViewName("redirect:admin/welcome.jsp");
					}
				break;
			case 2:
			
				if(pathJurisdiction[0].equals("redirect:person")){
					mv.setViewName("redirect:manager/welcome.jsp");
				}else if(pathJurisdiction[0].equals("redirect:admin")){
					session.setAttribute("mess", "请去到相应权限页面");
					mv.setViewName("redirect:manager/welcome.jsp");
				}
				break;
			case 3:
			
				if(pathJurisdiction[0].equals("redirect:admin")){
					mv.setViewName("redirect:person/welcome.jsp");
				}if(pathJurisdiction[0].equals("redirect:manager")){
					mv.setViewName("redirect:person/welcome.jsp");//如果想跨权限跳转，直接取对应的主页
				}
				break;
			default:
				mv.setViewName("redirect:error.jsp");
				break;
				}
			}
		}
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		boolean isFlag = false;//拦截器请求是否拦截
		//第一步：循环遍历上方数组请求URL路径和浏览器请求URL匹配
		//如果一致，放开请求继续进入
		String urlPath = request.getServletPath();
		System.out.println("浏览器发起URL路径："+urlPath);
		
		for (String requestURL : IGNORE_URI) {
			if (urlPath.contains(requestURL)) {
				//true:两次请求URL匹配
				isFlag = true;
				break;
			}
		}
		//第二步：会话范围内获取登录用户对象实例，如果存在
		//放开请求进入对应目标资源（页面/控制器）
		Employee loginUser = (Employee) request.getSession().getAttribute("empLogin");
		if (!isFlag) {
			if (loginUser != null) {
				isFlag = true;//有用户直接放开请求
			} else {
				//如果未登录直接取登录页面
				request.getRequestDispatcher("login.jsp").forward(request, response);
				isFlag = false;
			}
		}
		return isFlag;
		
	}

}
