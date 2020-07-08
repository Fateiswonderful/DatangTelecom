<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>新建计划</title>
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
      <p><a href="task.html" target="_self" >计划管理</a></p>
      <p><a href="queryPlanByTaskIdByEmpId.do?implementor_Id=${empLogin.employee_Id}" target="_self">查询计划</a></p>
      <p><a href="queryTaskByEmpId.do?employee_Id=${empLogin.employee_Id}" target="_self">我的任务</a></p>
      <p ><a href="logout.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 计划管理 &gt;&gt; 新建计划</p>
                <h1>输入新计划信息</h1>
        
        <form id="form1" name="form1" method="post" action="insertPlan.do">
          <p>计划名称：
            <label>
            <input type="hidden" name="task_Id" value="${sff.task.task_Id}">
          <input name="plan_Name" type="text" size="50" />
          </label></p>
          <p>计划描述：
            <label>
            <textarea name="plan_Desc"></textarea>
            </label>
          </p>
            <p>开始时间：
              <label>
                <input name="begin_Date" type="text" size="16" />
              </label>
             <span class="marginleft1">结束时间：
              <label>
                <input name="end_Date" type="text" size="16" />
              </label></span>
          </p>
          <p>计划状态：
             待实施          </p>
          <p>是否反馈： 未反馈</p>
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
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>
</html>
