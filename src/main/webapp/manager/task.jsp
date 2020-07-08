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
    
    <title>制定任务</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function insert(){
		var beg=document.getElementById("begin_Date").value;
		var end=document.getElementById("end_Date").value;
		
		var pattern=/^\d{4}-\d{1,2}-\d{1,2}$/;
		if(pattern.test(beg)&&pattern.test(end)||end==""||beg==""){
			return true;
		}else{
			alert("请填写正确的日期格式如:2020-01-29");
			return false;
		}
		
	}
</script>
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
        <p>您现在的位置 &gt;&gt; 制定任务 &gt;&gt; 新建任务</p>
        <h1>输入新任务信息</h1>
        
        <form  method="post" action="managerNewTask.do" onsubmit="return insert()">
          <p>任务名称：<label>
          <input name="task_Name" type="text" size="50" />
       	  <input type="hidden" name="assigner_Id" value="${empLogin.employee_Id}" >
         </label></p>
          <p>任务描述：
            <label>
            <textarea name="task_Desc"></textarea>
            </label>
          </p>
            <p>开始时间：
              <label>
                <input id="begin_Date" name="begin_Date" type="text" size="16"  />
              </label>
             <span class="marginleft1">结束时间：
              <label>
                <input id="end_Date" name="end_Date" type="text" size="16" />
              </label></span>
          </p>
          <p>实施人员：
            <label>
              <select name="implementor_Id">
              <c:forEach items="${managerQueryStaff }" var="emp">
                <option value="${emp.employee_Id}"> ${emp.real_Name }</option>
              </c:forEach>
              </select>
            </label>
            <span class="marginleft">任务状态：未实施</span></p>
            <p>
              <label>
              <input  type="reset" class="menu2" value="重置" />
              </label>
           &nbsp; 
              <label>
              <input  type="submit" class="menu1" value="提交" />
              </label>
           </p>
      </form>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
