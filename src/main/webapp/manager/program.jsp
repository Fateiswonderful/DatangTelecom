<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<div id="logo"><img src="images/top.jpg" width="1002" height="258" /></div>
<!-- #EndLibraryItem --><table width="1002" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left.lbi" --><div id="left">
      <p><a href="queryTaskByAssigner.do?assigner_Id=${empLogin.employee_Id}" target="_self">查看任务</a></p>
      <p><a href="managerQueryStaff.do?employee_Id=${empLogin.employee_Id}" target="_self">制定任务</a></p>
      <p><a href="queryDeleteTaskByAssigner.do?assigner_Id=${empLogin.employee_Id}" target="_self">调整任务</a></p>
      <p><a href="trackingTaskList.do?assigner_Id=${empLogin.employee_Id}" target="_self">跟踪任务</a></p>
      <p><a href="managerQueryStaffList.do?employee_Id=${empLogin.employee_Id}" target="_self">查看人员</a></p>
      <p><a href="logout.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 查看任务 &gt;&gt; 计划详细信息</p>
		<h1>计划详细信息：</h1>
        <form id="form1" name="form1" method="post" action="manager/taskparticular.jsp">
		  
		  <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="579" colspan="3">${managerQueryPlanById.plan_Name}</td>
            </tr>
            <tr>
              <td class="tdcolor">计划描述</td>
              <td colspan="3">${managerQueryPlanById.plan_Desc}</td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="579"><fmt:formatDate value="${managerQueryPlanById.begin_Date}"/></td>
              <td width="20%" class="tdcolor">结束时间</td>
              <td width="50%"><p><fmt:formatDate value="${managerQueryPlanById.end_Date}"/></p></td>
            </tr>
            <tr>
              <td class="tdcolor">所属任务</td>
              <td>${managerQueryPlanById.task_Id}</td>
              <td class="tdcolor">计划状态</td>
              <td>${managerQueryPlanById.status}</td>
            </tr>
            <tr>
              <td class="tdcolor">反馈信息</td>
              <td colspan="3">${managerQueryPlanById.feedback_Info}</td>
            </tr>
          </table>
		  <p>
              <label>
              <input name="Submit" type="submit" class="menu4" value="返回" />
            </label>
          </p>
      </form>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/copyright.lbi" --><div class="copyright">COPYRIGHT 2007 DATANG TELECOM TECHNOLOGY CO.LTD 京ICP备06071639号</div><!-- #EndLibraryItem --><!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>
</html>
