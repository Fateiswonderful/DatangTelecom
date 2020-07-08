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
    
    <title>任务详细信息</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function selected(){
		var rids=document.getElementsByName("plan_Id");
		var count=0;//表示几个单选
		for(var i=0;i<rids.length;i++){
			if(rids[i].checked){
				count++;
			}
		}
		if(count==0){
			alert("请选择计划");
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
        <p>您现在的位置 &gt;&gt; 查看任务 &gt;&gt; 任务详细信息</p>
        <h1>任务详细信息:</h1>

          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="579" colspan="5">任务一</td>
            </tr>
            <tr>
              <td class="tdcolor">任务描述</td>
              <td colspan="5">${pb.data1.task.task_Desc}</td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="15%"><fmt:formatDate value="${pb.data1.task.begin_Date}"/></td>
              <td width="20%" class="tdcolor">结束时间</td>
              <td width="50%" colspan="3"><p><fmt:formatDate value="${pb.data1.task.end_Date}"/></p>              </td>
            </tr>
            <tr>
              <td class="tdcolor">实际开始时间</td>
              <td><fmt:formatDate value="${pb.data1.task.real_Begin_Date}"/></td>
              <td class="tdcolor">实际结束时间</td>
              <td colspan="3"><fmt:formatDate value="${pb.data1.task.real_End_Date}"/></td>
            </tr>
            <tr>
              <td class="tdcolor">实施人</td>
              <td>${pb.data1.emp.real_Name }</td>
              <td class="tdcolor">任务状态</td>
              <td>${pb.data1.task.status }</td>
              <td class="tdcolor">计划数目</td>
              <td>${pb.data1.plans.size() }</td>
            </tr>
        </table>
	    <form id="form1" name="form1" method="post" onsubmit="return selected()" action="managerQueryPlanByPlanId.do">
		  <h1>实施计划：</h1>
		  <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="15%" class="tdcolor">完成状态</td>
              <td width="20%" class="tdcolor">是否反馈</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
            <c:forEach items="${pb.data1.plans}" var="plan">
            <tr>
              <td>${plan.plan_Name }</td>
              <td>${plan.status }</td>
              <td>${plan.is_Feedback }</td>
              <td><fmt:formatDate value="${plan.begin_Date }"/> </td>
              <td><fmt:formatDate value="${plan.end_Date }"/></td>
              <td><label>
                <input type="radio" name="plan_Id" value="${plan.plan_Id }" />
              </label></td>
            </tr>
           </c:forEach>
          </table>
		  <p>
              <label>
              <input name="Submit" type="submit" class="menu3" value="详细信息" />
            </label>
          </p>
      </form>
      	<a href="managerQueryPlanByTaskId.do?task_Id=${pb.data1.task.task_Id}&pageNo=${pb.homePage}">首页</a>
		<a href="managerQueryPlanByTaskId.do?task_Id=${pb.data1.task.task_Id}&EmpStaffLoad.do?pageNo=${pb.previousPage}">上一页</a>
		<a href="managerQueryPlanByTaskId.do?task_Id=${pb.data1.task.task_Id}&pageNo=${pb.nextPage}">下一页</a>
		<a href="managerQueryPlanByTaskId.do?task_Id=${pb.data1.task.task_Id}&pageNo=${pb.trailerPage}">末页</a>
		<a>共${pb.recordCount }条记录</a>
		<a>共${pb.totalCount }页</a>
		<a>第${pb.pageNo}页</a>
		<a>每页显示${pb.pageSize}条记录</a>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
