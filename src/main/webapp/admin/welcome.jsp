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
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->




<div id="logo"><img src="images/top.jpg" width="1200" height="258" /></div>
<!-- #EndLibraryItem --><table width="1200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left3.lbi" -->

<div id="left2">
      <p><a href="queryAllEmp.do" target="_self" >用户管理</a></p>
      <p><a href="EmpStaffLoad.do" target="_self">员工管理</a></p>
      <p><a href="empAllotLoad.do" target="_self">分配人员</a></p>
      <p ><a href="logout.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 欢迎光临</p>
          <h1>欢迎光临大唐电信系统管理员页面:<br/>
          <span style="color: red;">
        			<% 
         	 			Employee e= (Employee)session.getAttribute("empLogin");
         	 			if(e!=null){
         	 				out.println("人员:"+e.getReal_Name()+"<br/>");
         	 				out.println("身份:"+e.getRole().getRole_Name());
         	 			}
           			%>
        		</span></h1>
          
    </div></td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
