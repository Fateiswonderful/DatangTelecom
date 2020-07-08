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
    
    <title>查看人员</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function selected(){
		var rids=document.getElementsByName("employee_Id");
		var count=0;//表示几个单选
		for(var i=0;i<rids.length;i++){
			if(rids[i].checked){
				count++;
			}
		}
		if(count==0){
			alert("请选择人员");
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
        <p>您现在的位置 &gt;&gt; 查看人员 &gt;&gt; 人员信息</p>
        <h1>人员信息:</h1>
        <form id="form1" name="form1" method="post" onsubmit="return selected()" action="managerQueryStaffByStaffId.do">
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">姓名</td>
              <td class="tdcolor">性别</td>
              <td class="tdcolor">入职时间</td>
              <td class="tdcolor">职位</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
            <c:forEach items="${pb.data}" var="e">
            <tr>
              <td>${e.real_Name}</td>
              <td>${e.sex}</td>
              <td><fmt:formatDate value="${e.enrolldate}"/> </td>
              <td>${e.duty }</td>
              <td><label>
                <input type="radio" name="employee_Id" value="${e.employee_Id}" />
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
      	<a href="managerQueryStaffList.do?employee_Id=${empLogin.employee_Id}&pageNo=${pb.homePage}">首页</a>
		<a href="managerQueryStaffList.do?employee_Id=${empLogin.employee_Id}&EmpStaffLoad.do?pageNo=${pb.previousPage}">上一页</a>
		<a href="managerQueryStaffList.do?employee_Id=${empLogin.employee_Id}&pageNo=${pb.nextPage}">下一页</a>
		<a href="managerQueryStaffList.do?employee_Id=${empLogin.employee_Id}&pageNo=${pb.trailerPage}">末页</a>
		<a>共${pb.recordCount }条记录</a>
		<a>共${pb.totalCount }页</a>
		<a>第${pb.pageNo}页</a>
		<a>每页显示${pb.pageSize}条记录</a>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
