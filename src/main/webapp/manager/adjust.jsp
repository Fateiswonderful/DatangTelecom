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
    
   <title>调整任务</title>
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
        <p>您现在的位置 &gt;&gt; 调整任务 &gt;&gt; 调整任务信息</p>
        <h1>调整任务信息</h1>
        
        <form id="form1" name="form1" method="post" action="managerUpdateTaskById.do">
          <p>任务名称：<label>
          <input name="task_Name" type="text" size="50" value="${managerQueryTask.task_Name }" />
          </label></p>
          <p>任务描述：
            <label>
            <textarea name="task_Desc" value="${managerQueryTask.task_Desc }"></textarea>
            </label>
          </p>
            <p>开始时间：
              <label>
                <input name="begin_Date" type="text" size="16" value="<fmt:formatDate value="${managerQueryTask.begin_Date }"/>" />
              </label>
             <span class="marginleft1">结束时间：
              <label>
                <input name="end_Date" type="text" size="16"  value="<fmt:formatDate value="${managerQueryTask.end_Date }"/>"/>
              </label></span>
          </p>
          <p>实施人员：
            <label>
              <select name="implementor_Id">
              	<c:forEach items="${managerQueryStaff}" var="emp">
              		<c:if test="${emp.employee_Id==managerQueryTask.implementor_Id }"><!-- 实施人和下属员工相对。默认选中 -->
                		<option value="${emp.employee_Id }" selected="selected">${emp.real_Name }</option>
                	</c:if>
                	<c:if test="${emp.employee_Id!=managerQueryTask.implementor_Id }">
                		<option value="${emp.employee_Id }">${emp.real_Name }</option>
                	</c:if>
                </c:forEach>
              </select>
            </label>
            <span class="marginleft">任务状态：
            <input type="hidden" name="task_Id" value="${managerQueryTask.task_Id }">
            <input type="hidden" name="assigner_Id" value="${empLogin.employee_Id}">
             ${managerQueryTask.status }
            </span></p>
            <p>
              <label>
              <input name="Submit" type="reset" class="menu2" value="重置" />
              </label>
           &nbsp; 
              <label>
              <input name="Submit2" type="submit" class="menu1" value="提交" />
              </label>
           </p>
      </form>
        <p>&nbsp;</p>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>
</html>
