<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
        <p>您现在的位置 &gt;&gt; 分配人员</p>
        <h1>用户详细信息:</h1>
		<form method="post" action="allocationStaff.do">
        <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
          <tr>
            <td class="tdcolor">
            <input type="hidden" name="employee_Id" value="${queryEmpById.employee_Id}"> 
            		用户名称
            		
           </td>
            <td>&nbsp;${queryEmpById.employee_Name }</td>
          </tr>
          <tr>
            <td width="15%" class="tdcolor">真实姓名</td>
            <td>&nbsp;${queryEmpById.real_Name }</td>
          </tr>
          <tr>
            <td class="tdcolor">行业角色</td>
            <td>&nbsp;${queryEmpById.role.role_Name }</td>
          </tr>
          <tr>
            <td class="tdcolor">性&nbsp;&nbsp;&nbsp; 别</td>
            <td>&nbsp;${queryEmpById.sex }</td>
          </tr>
          <tr>
            <td class="tdcolor">入职时间</td>
            <td>&nbsp;${queryEmpById.enrolldate }</td>
          </tr>
          <tr>
            <td class="tdcolor">职位信息</td>
            <td>&nbsp;${queryEmpById.duty }</td>
          </tr>
          <tr>
            <td class="tdcolor">出生年月</td>
            <td>&nbsp;${queryEmpById.birthday }</td>
          </tr>
          <tr>
            <td class="tdcolor">学历信息</td>
            <td>&nbsp;${queryEmpById.education }</td>
          </tr>
          <tr>
            <td class="tdcolor">专业信息</td>
            <td>&nbsp;${queryEmpById.major }</td>
          </tr>
          <tr>
            <td class="tdcolor">行业经验</td>
            <td>&nbsp;${queryEmpById.experience }</td>
          </tr>
          <tr>
            <td class="tdcolor">上级主管</td>
            <td><label>
              <select name="parent_Id">
              	<option >请选择</option>
              	<c:forEach items="${managers}" var="man">
              		<c:if test="${queryEmpById.parent_Id==man.employee_Id }">
              			<option value="${man.employee_Id }" selected="selected">${man.real_Name }</option>
              		</c:if>
              		<c:if test="${queryEmpById.parent_Id!=man.employee_Id }">
              			<option value="${man.employee_Id }">${man.real_Name }</option>
              		</c:if>
              	</c:forEach>
              </select>
            </label></td>
          </tr>
        </table>
        <p>&nbsp;</p>

          <p>
            <input name="Submit" type="reset" class="menu2" value="取消" />
            <label>
            <input name="Submit2" type="submit" class="menu1" value="提交" />
            </label>
          </p>
      </form>
    </div>    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
