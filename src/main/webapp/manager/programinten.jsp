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
<script type="text/javascript">
	function selected(){
		var rids=document.getElementsByName("plan_id");
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
   <title>跟踪计划信息</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.2.0.js"></script>
</head>
<script type="text/javascript">
	
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
        <p>您现在的位置 &gt;&gt; 跟踪任务 &gt;&gt; 跟踪计划信息</p>
		 <form id="form1" name="form1" method="post"  action="managerUpdateStatus.do">
		<h1>任务详细信息:</h1>
          
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="579" colspan="3">
              <input type="hidden" name="task_Id" value="${pb.data1.task.task_Id }">
              <input type="hidden" name="assigner_Id" value="${empLogin.employee_Id}">
              ${pb.data1.task.task_Name }
              
              </td>
            </tr>
            <tr>
              <td class="tdcolor">任务描述</td>
              <td colspan="3">${pb.data1.task.task_Desc }</td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="579"> <fmt:formatDate value="${pb.data1.task.begin_Date }"/> </td>
              <td width="579" class="tdcolor">结束时间</td>
              <td width="579"><p><fmt:formatDate value="${pb.data1.task.end_Date }"/></p>              </td>
            </tr>
            
            <tr>
              <td class="tdcolor">实施人</td>
              <td>${pb.data1.emp.real_Name }</td>
              <td class="tdcolor">任务状态</td>
              <td>
               
                  <select name="status">
                    <option value="实施中" selected="selected">实施中</option>
                    <c:if test="${pb.data1.task.status=='已完成' }">
                    	<option value="已完成" selected="selected">已完成</option>
                    </c:if>
                    <c:if test="${pb.data1.task.status!='已完成' }">
                    	<option value="已完成">已完成</option>
                    </c:if>
                  </select>              </td>
            </tr>
        </table>
		<input name="Submit" type="submit" class="menu4" value="提交" />
		</form>
       <form id="form2" name="form1" method="post" onsubmit="return selected()" action="checkboxPlan.do">
		  <h1>计划信息：</h1>
		  <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="15%" class="tdcolor">完成状态</td>
              <td class="tdcolor">是否反馈</td>
              <td class="tdcolor">开始时间</td>
              <td class="tdcolor">结束时间</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
            <c:forEach items="${pb.data1.plans }" var="plan">
            <tr>
              <td>${plan.plan_Name }</td>
              <td>${plan.status }</td>
              <td>${plan.is_Feedback }</td>
              <td><fmt:formatDate value="${plan.begin_Date }"/> </td>
              <td><fmt:formatDate value="${plan.end_Date }"/></td>
              <c:if test="${plan.status=='已完成' }">
              <td>
                <input type="checkbox" name="plan_id"  value="${plan.plan_Id}" />
              </td>
              </c:if>
            </tr>
            </c:forEach>
          </table>
		  <p>
              <label>
              <input id="feedback" type="submit"  class="menu3" value="反馈信息" />
            </label>
          </p>
      </form>
      <a href="trackingTaskByTaskId.do?task_Id=${pb.data1.task.task_Id}&pageNo=${pb.homePage}">首页</a>
		<a href="trackingTaskByTaskId.do?task_Id=${pb.data1.task.task_Id}&EmpStaffLoad.do?pageNo=${pb.previousPage}">上一页</a>
		<a href="trackingTaskByTaskId.do?task_Id=${pb.data1.task.task_Id}&pageNo=${pb.nextPage}">下一页</a>
		<a href="trackingTaskByTaskId.do?task_Id=${pb.data1.task.task_Id}&pageNo=${pb.trailerPage}">末页</a>
		<a>共${pb.recordCount }条记录</a>
		<a>共${pb.totalCount }页</a>
		<a>第${pb.pageNo}页</a>
		<a>每页显示${pb.pageSize}条记录</a>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/copyright.lbi" --><div class="copyright">COPYRIGHT 2007 DATANG TELECOM TECHNOLOGY CO.LTD 京ICP备06071639号</div><!-- #EndLibraryItem --><!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>
</html>
