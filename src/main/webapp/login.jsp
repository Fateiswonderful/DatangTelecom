<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>登录页面</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="logo"><img src="images/logo.jpg" alt="大唐电信首页" width="1002" height="392" /></div>
<div class="login" id="middle">
  <form action="stafflogin.do" method="post" name="form001"  id="form001">
    <p>
      <label>
      用户名：<input name="employee_Name" type="text" />
    </label></p>
    <p>  密 码：     
      <label>
    <input type="text" name="password" />
    </label></p>
    <p>角 色：
      <label>
      <select name="admin">
        <option value="manager" selected="selected">主管</option>
        <option value="admin">系统管理员</option>
        <option value="employees">员工</option>
      </select>
      </label>
    </p>
    
    <p>
      <label class="left007-bg">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      <input name="Submit" type="submit" class="menu1" value="提交" />
      </label>
    </p>
  </form>
</div>
<div id="nutton"><img src="images/button.jpg" width="1002" height="17" /></div>
</body>
</html>
