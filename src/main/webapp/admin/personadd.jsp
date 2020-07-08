<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新建用户</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function insert(){
		var birthday=document.getElementById("birthday").value;
		var enrolldate=document.getElementById("enrolldate").value;
		
		var pattern=/^\d{4}-\d{1,2}-\d{1,2}$/;
		if(pattern.test(birthday)&&pattern.test(enrolldate)){
			return true;
		}else{
			alert("请填写正确的日期格式如:2020-01-29");
			return false;
		}
		
	}
</script>
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
        <p>您现在的位置 &gt;&gt; 添加人员 &gt;&gt; 人员详细信息</p>
        <h1>人员详细信息:</h1>
	  
	  <form id="form1" name="form1" method="post" onsubmit="return insert()" action="adminAddEmp.do">
          <p>用户名称：
            
            <input name="employee_Name" type="text" size="16"  required="required" />
          </p>
          <p>真实姓名：
            
            <input name="real_Name" type="text" size="16" required="required" />
          </p>
          <p>性&nbsp;&nbsp;&nbsp; 别：
            <input name="sex" type="radio" value="男" checked="checked" />
          男
          <input type="radio" name="sex" value="女" />
          女
          </p>
          <p>出生年月：
            <input id="birthday" name="birthday" type="text" size="16"  />
          </p>
          <p>职位信息：
              <input name="duty" type="text" size="16" required="required" />
          </p>
          <p>入职时间：
            <input id="enrolldate" name="enrolldate" type="text" size="16" />
</p>
          <p>学历信息：
            <select name="education">
              <option value="小学">小学</option>
              <option value="初中">初中</option>
              <option value="高中">高中</option>
              <option value="大学">大学</option>
              <option value="大专">大专</option>
              <option value="硕士">硕士</option>
              <option value="博士">博士</option>
              <option value="博士后">博士后</option>
                       &nbsp;&nbsp; </select>
            <span class="marginleft">专业信息：</span>
            <select name="major">
                        <option value="市场营销">市场营销</option>
                        <option value="金融管理">金融管理</option>
                        <option value="会计">会计</option>
                        <option value="软件工程师">软件工程师</option>
            </select>
          </p>
          <p>行业经验：
            <label>
            <textarea name="experience" cols="44" required="required"></textarea>
            </label>
          </p>
          <p>所属角色：
            <label>
            <select name="role_Id">
              <option value="1">系统管理员</option>
              <option value="2">主管</option>
              <option value="3">员工</option>
            </select>
            </label>
          </p>
          <p>初始密码：
            <input name="password" type="password" size="16" maxlength="6" required="required" />
          </p>
          <p>&nbsp; </p>
            <p>
              <input name="Submit" type="reset" class="menu2" value="重置" />
           &nbsp; 
              
              <input name="Submit2" type="submit" class="menu1" value="提交" />
           </p>
      </form>
    </div>    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem --></body>

</html>
