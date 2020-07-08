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
			alert("请选择员工");
			return false;
		}
	}
</script>    
   <title>分配人员</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body><!-- #BeginLibraryItem "/Library/topbanner.lbi" -->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<div id="logo"><img src="images/top.jpg" width="1002" height="258" /></div>
<!-- #EndLibraryItem --><table width="1002" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="rightimg"><!-- #BeginLibraryItem "/Library/left3.lbi" -->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<div id="left2">
      <p><a href="queryAllEmp.do" target="_self" >用户管理</a></p>
      <p><a href="EmpStaffLoad.do" target="_self">员工管理</a></p>
      <p><a href="empAllotLoad.do" target="_self">分配人员</a></p>
      <p ><a href="logout.do" target="_self">退出系统</a></p>
</div><!-- #EndLibraryItem --><div id="right">
        <p>您现在的位置 &gt;&gt; 用户管理 &gt;&gt; 分配列表</p>
        <h1>用户详细信息:</h1>
	  
	    <form id="form1" name="form1" method="post" onsubmit="return selected()" action="adminAllocationEmp.do">
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">用户名称</td>
              <td class="tdcolor">用户密码</td>
              <td class="tdcolor">用户角色</td>
              <td class="tdcolor">真实姓名</td>
              <td class="tdcolor">入职时间</td>
              <td class="tdcolor">职位信息</td>
              <td class="tdcolor">&nbsp;</td>
            </tr>
            <c:forEach items="${adminQueryEmpPb.data}" var="emp">
	           <tr>
              		<td>${emp.employee_Name}</td>
              		<td>${emp.password}</td>
              		<td>${emp.role.role_Name}</td>
              		<td>${emp.real_Name}</td>
              		<td><fmt:formatDate value="${emp.enrolldate}"/></td>
              		<td>${emp.duty}</td>
              		 <td>
              		 	<label><input type="radio" name="employee_Id" value="${emp.employee_Id}"/></label>
              		</td>
               </tr>
            </c:forEach>
          </table>
	      <p>
            <label></label>
            <label>
            <input name="Submit2" type="submit" class="menu4" value="详情" />
            </label>
	      </p>
        </form>
        <a href="empAllotLoad.do?pageNo=${adminQueryEmpPb.homePage}&pageSize=${adminQueryEmpPb.pageSize}">首页</a>
		<a href="empAllotLoad.do?pageNo=${adminQueryEmpPb.previousPage}&pageSize=${adminQueryEmpPb.pageSize}">上一页</a>
		<a href="empAllotLoad.do?pageNo=${adminQueryEmpPb.nextPage}&pageSize=${adminQueryEmpPb.pageSize}">下一页</a>
		<a href="empAllotLoad.do?pageNo=${adminQueryEmpPb.trailerPage}&pageSize=${adminQueryEmpPb.pageSize}">末页</a>
		<a>共${adminQueryEmpPb.recordCount }条记录</a>
		<a>共${adminQueryEmpPb.totalCount }页</a>
		<a>第${adminQueryEmpPb.pageNo}页</a>
		<a>每页显示${adminQueryEmpPb.pageSize}条记录</a>
	    <p>&nbsp;</p>
</div></td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
