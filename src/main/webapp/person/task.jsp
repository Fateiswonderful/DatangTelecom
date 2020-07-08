<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>我的任务</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function selected(){
		var rids=document.getElementsByName("task_Id");
		var count=0;//表示几个单选
		for(var i=0;i<rids.length;i++){
			if(rids[i].checked){
				count++;
			}
		}
		if(count==0){
			alert("请选择任务");
			return false;
		}
	}
</script>
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
        <p>您现在的位置 &gt;&gt; 我的任务 &gt;&gt; 任务信息</p>
        <h1>任务信息:</h1>
        <form id="form1" name="form1" method="post" action="queryTaskById.do" onsubmit="return selected()">
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="15%" class="tdcolor">制定人</td>
              <td width="15%" class="tdcolor">开始时间</td>
              <td width="15%" class="tdcolor">结束时间</td>
              <td width="15%" class="tdcolor">任务状态</td>
              <td width="15%" class="tdcolor">计划数目</td>
              <td width="10%" class="tdcolor">&nbsp;</td>
            </tr>
            <c:forEach items="${pb.data}" var="sff" varStatus="i">
            <tr>
              <td>${sff.task.task_Name }</td>
              <td>${sff.emp.real_Name }</td>
              <td><fmt:formatDate value="${sff.task.begin_Date }"/> </td>
              <td><fmt:formatDate value="${sff.task.end_Date }"/></td>
              <td>${sff.task.status }</td>
              <td>${sff.plans.size() }</td>
              <td><input type="radio" name="task_Id" value="${sff.task.task_Id}" /></td>
            </tr>
			</c:forEach>
          </table>
    		<p>
              <label>
              <input name="Submit" type="submit" class="menu3" value="计划管理" />
            </label>
          </p>
      </form>
      <a href="queryTaskByEmpId.do?employee_Id=${empLogin.employee_Id}&pageNo=${pb.homePage}">首页</a>
		<a href="queryTaskByEmpId.do?employee_Id=${empLogin.employee_Id}&EmpStaffLoad.do?pageNo=${pb.previousPage}">上一页</a>
		<a href="queryTaskByEmpId.do?employee_Id=${empLogin.employee_Id}&pageNo=${pb.nextPage}">下一页</a>
		<a href="queryTaskByEmpId.do?employee_Id=${empLogin.employee_Id}&pageNo=${pb.trailerPage}">末页</a>
		<a>共${pb.recordCount }条记录</a>
		<a>共${pb.totalCount }页</a>
		<a>第${pb.pageNo}页</a>
		<a>每页显示${pb.pageSize}条记录</a>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>

</html>
