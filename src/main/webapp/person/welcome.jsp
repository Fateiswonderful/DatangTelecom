<%@page import="pers.deng.DatangTelecom.data.bean.Employee"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎光临大唐电信</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<div id="logo"><img src="images/top.jpg" width="1002" height="258" /></div>
<!-- #EndLibraryItem --><table width="1002" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left2.lbi" -->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<div id="left">
      <p><a href="person/taskview.jsp" target="_self" >计划管理</a></p>
      <p><a href="queryPlanByTaskIdByEmpId.do?implementor_Id=${empLogin.employee_Id}" target="_self">查询计划</a></p>
      <p><a href="queryTaskByEmpId.do?employee_Id=${empLogin.employee_Id}" target="_self">我的任务</a></p>
      <p ><a href="logout.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 欢迎光临</p>
        <h1>
        		欢迎光临大唐电信员工页面:<br/><span style="color: red;">
        			<% 
         	 			Employee e= (Employee)session.getAttribute("empLogin");
         	 			if(e!=null){
         	 				out.println("人员:"+e.getReal_Name()+"<br/>");
         	 				out.println("身份:"+e.getRole().getRole_Name());
         	 			}
         	 		%>
        		</span>
        
        </h1>
        
        </div></td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>
</html>
