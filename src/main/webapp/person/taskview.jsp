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
    
   <title>计划信息</title>
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
        <p>您现在的位置 &gt;&gt; 计划管理 &gt;&gt; 计划信息</p>
        <form id="form1" name="form1" method="post" action="person/newpro.jsp">
		<h1>任务详细信息:</h1>
          
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">任务名称</td>
              <td width="579" colspan="3">${pb.data1.task.task_Name }</td>
            </tr>
            <tr>
              <td class="tdcolor">任务描述</td>
              <td colspan="3">${pb.data1.task.task_Desc }</td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="579">${pb.data1.task.begin_Date }</td>
              <td width="579" class="tdcolor">结束时间</td>
              <td width="579"><p>${pb.data1.task.end_Date }</p>              </td>
            </tr>
            <tr>
              <td class="tdcolor">实施人</td>
              <td>${pb.data1.emp.real_Name }</td>
              <td class="tdcolor">任务状态</td>
              <td>
              	${pb.data1.task.status }
              </td>
            </tr>
        </table>


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
            <c:forEach items="${pb.data1.plans}" var="plan">
            <tr>
              <td>
              <c:if test="${plan.is_Feedback!='是' }">
              	<a href="queryPlanByPlanId.do?plan_Id=${plan.plan_Id }" target="_self">${plan.plan_Name}</a>
              </c:if>
              <c:if test="${plan.is_Feedback=='是' }">
              	${plan.plan_Name}
              </c:if>
              </td>
              <td>${plan.status }</td>
              <td>${plan.is_Feedback }</td>
              <td><fmt:formatDate value="${plan.begin_Date }"/> </td>
              <td><fmt:formatDate value="${plan.end_Date }"/></td>
              <c:if test="${plan.status=='待实施' }">
              	<td><label>
                	<a href="deletePlanById.do?plan_Id=${plan.plan_Id}&task_Id=${sff.task.task_Id}">删除</a>
              		</label>
              	</td>
              </c:if>
              <c:if test="${plan.status !='待实施'}">
              	<td>计划已完成不能进行操作</td>
              </c:if>
            </tr>
            </c:forEach>
          </table>
		  <p>
		  <c:if test="${sff.task.status=='实施中'}" >
		    <input name="Submit2" type="submit" class="menu2" value="新建" />
		  </c:if>
          </p>
      </form>
      <a href="queryTaskById.do?task_Id=${pb.data1.task.task_Id }&pageNo=${pb.homePage}">首页</a>
		<a href="queryTaskById.do?task_Id=${pb.data1.task.task_Id }&pageNo=${pb.previousPage}">上一页</a>
		<a href="queryTaskById.do?task_Id=${pb.data1.task.task_Id }&pageNo=${pb.nextPage}">下一页</a>
		<a href="queryTaskById.do?task_Id=${pb.data1.task.task_Id }&pageNo=${pb.trailerPage}">末页</a>
		<a>共${pb.recordCount}条记录</a>
		<a>共${pb.totalCount}页</a>
		<a>第${pb.pageNo}页</a>
		<a>每页显示${pb.pageSize}条记录</a>
    </div>    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>
</html>
