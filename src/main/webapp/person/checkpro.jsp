<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>查询计划</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
	<link href="css/css.css" rel="stylesheet" type="text/css" />
	<div id="logo">
		<img src="images/top.jpg" width="1002" height="258" />
	</div>
	<!-- #EndLibraryItem -->
	<table width="1002" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="rightimg">
				<!-- #BeginLibraryItem "/Library/left2.lbi" -->
				<link href="css/css.css" rel="stylesheet" type="text/css" />
				<div id="left">
					<p>
						<a href="person/taskview.jsp" target="_self">计划管理</a>
					</p>
					<p>
						<a
							href="queryPlanByTaskIdByEmpId.do?implementor_Id=${empLogin.employee_Id}"
							target="_self">查询计划</a>
					</p>
					<p>
						<a href="queryTaskByEmpId.do?employee_Id=${empLogin.employee_Id}"
							target="_self">我的任务</a>
					</p>
					<p>
						<a href="logout.do" target="_self">退出系统</a>
					</p>
				</div>
				<!-- #EndLibraryItem -->
				<div id="right">
					<p>您现在的位置 &gt;&gt; 查询计划 &gt;&gt; 查询</p>


					<form method="post" action="queryPlanByTaskIdByEmpId.do">
						<h1>查询信息:</h1>
						<table width="700" border="0" cellpadding="0" cellspacing="0"
							class="table">
							<tr>
								<td width="15%" class="tdcolor">计划名称</td>
								<td width="579"><input type="text" name="plan_Name">
									<input type="hidden" name="implementor_Id"
									value="${empLogin.employee_Id}"></td>
							</tr>
							<tr>
								<td class="tdcolor">所属任务</td>
								<td><select name="task_Id">
										<c:forEach items="${tas}" var="ta">
											<option value="${ta.value.task_Id}">${ta.value.task_Name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td class="tdcolor">开始时间</td>
								<td>从 <input name="begin_Date" type="text" size="15" /> 到
									<input name="begin_Date1" type="text" size="15" />
								</td>
							</tr>
							<tr>
								<td class="tdcolor">结束时间</td>
								<td>从 <input name="end_Date" type="text" size="15" /> 到 
								<input name="end_Date1" type="text" size="15" /></td>
							</tr>
							<tr>
								<td class="tdcolor">是否反馈</td>
								<td><label> 
									<input name="is_Feedback" type="text" size="15" />
								</label></td>
							</tr>
						</table>
						<p>
							<input name="" type="submit" class="menu3" value="查询计划" />
						</p>
					</form>
					
					
					<!-- 显示计划 -->
					<h1>计划信息：</h1>
					<table width="700" border="0" cellpadding="0" cellspacing="0"
						class="table">
						<tr>
							<td width="15%" class="tdcolor">计划名称</td>
							<td width="15%" class="tdcolor">所属任务</td>
							<td class="tdcolor">开始时间</td>
							<td class="tdcolor">结束时间</td>
							<td class="tdcolor">计划状态</td>
							<td class="tdcolor">是否反馈</td>
						</tr>
						<c:forEach items="${pb.data}" var="p">
							<tr>
								<td>
								<c:if test="${p.is_Feedback!='是' }">
              						<a href="queryPlanByPlanId.do?plan_Id=${p.plan_Id }" target="_self">${p.plan_Name}</a>
              					</c:if>
              					<c:if test="${p.is_Feedback=='是' }">
              						${p.plan_Name}
              					</c:if>
								</td>
								<td><c:forEach items="${tas}" var="ta">
										<c:if test="${ta.key==p.task_Id }">
              									${ta.value.task_Name}
              							</c:if>
									</c:forEach></td>
								<td><fmt:formatDate value="${p.begin_Date }" /></td>
								<td><fmt:formatDate value="${p.end_Date }" /></td>
								<td>${p.status }</td>
								<td><label>${p.is_Feedback }</label></td>
							</tr>
						</c:forEach>
					</table>
		<a href="queryPlanByTaskIdByEmpId.do?implementor_Id=${empLogin.employee_Id}&pageNo=${pb.homePage}">首页</a>
		<a href="queryPlanByTaskIdByEmpId.do?implementor_Id=${empLogin.employee_Id}&pageNo=${pb.previousPage}">上一页</a>
		<a href="queryPlanByTaskIdByEmpId.do?implementor_Id=${empLogin.employee_Id}&pageNo=${pb.nextPage}">下一页</a>
		<a href="queryPlanByTaskIdByEmpId.do?implementor_Id=${empLogin.employee_Id}&pageNo=${pb.trailerPage}">末页</a>
		<a>共${pb.recordCount}条记录</a>
		<a>共${pb.totalCount}页</a>
		<a>第${pb.pageNo}页</a>
		<a>每页显示${pb.pageSize}条记录</a>
				</div>
			</td>
		</tr>
	</table>
	<!-- #BeginLibraryItem "/Library/bottom.lbi" -->
	<div id="bottom">
		<img src="images/button.jpg" width="1002" height="17" />
	</div>
	<!-- #EndLibraryItem -->
</body>
</html>
