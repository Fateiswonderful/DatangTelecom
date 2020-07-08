<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人员详细信息</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

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
        <p>您现在的位置 &gt;&gt; 查看人员 &gt;&gt; 人员详细信息</p>
        <h1>人员详细信息:</h1>
        <form id="form1" name="form1" method="post" action="manager/checkper.jsp">
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">姓名</td>
              <td>${managerQueryStaffByStaffId.real_Name }</td>
            </tr>
            <tr>
              <td class="tdcolor">性别</td>
              <td>${managerQueryStaffByStaffId.sex }</td>
            </tr>
			<tr>
              <td class="tdcolor">入职时间</td>
              <td>${managerQueryStaffByStaffId.enrolldate }</td>
            </tr>
			<tr>
			  <td class="tdcolor">职位</td>
			  <td>${managerQueryStaffByStaffId.duty }</td>
		    </tr>
			<tr>
			  <td class="tdcolor">出生年月</td>
			  <td>${managerQueryStaffByStaffId.birthday }</td>
		    </tr>
			<tr>
			  <td class="tdcolor">学历</td>
			  <td>${managerQueryStaffByStaffId.education }</td>
		    </tr>
			<tr>
			  <td class="tdcolor">专业</td>
			  <td>${managerQueryStaffByStaffId.major }</td>
		    </tr>
			<tr>
			  <td class="tdcolor">行业经验</td>
			  <td>${managerQueryStaffByStaffId.experience }</td>
		    </tr>
          </table>
    <p>
              <label>
              <input name="Submit" type="submit" class="menu4" value="返回" />
            </label>
          </p>
      </form>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
