<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>反馈信息</title>
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
        <p>您现在的位置 &gt;&gt; 计划管理 &gt;&gt; 反馈信息</p>
        <form id="form1" name="form1" method="post" action="updatePlanStateByPlanId.do">
		<h1>输入反馈信息:</h1>
          
          <table width="700" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td width="15%" class="tdcolor">计划名称</td>
              <td width="579" colspan="3">
              <input type="hidden" name="plan_Id" value="${PlanByPlanId.plan_Id}"> 
              ${PlanByPlanId.plan_Name }
              
              </td>
            </tr>
            <tr>
              <td class="tdcolor">计划描述</td>
              <td colspan="3">&nbsp;${PlanByPlanId.plan_Desc }</td>
            </tr>
            <tr>
              <td class="tdcolor">开始时间</td>
              <td width="579"><fmt:formatDate value="${PlanByPlanId.begin_Date }"/> </td>
              <td width="579" class="tdcolor">结束时间</td>
              <td width="579"><p><fmt:formatDate value="${PlanByPlanId.end_Date }"/></p>              </td>
            </tr>
            
            <tr>
              <td class="tdcolor">计划状态</td>
              <td colspan="3">
               
                  <select name="status">
                  	<option value="待实施" selected="selected">待实施</option>
                  	<c:if test="${PlanByPlanId.status=='实施中' }">
                    <option value="实施中" selected="selected">实施中</option>
                    </c:if>
                    <c:if test="${PlanByPlanId.status!='实施中' }">
                    <option value="实施中">实施中</option>
                    </c:if>
                    <option value="已完成">已完成</option>
                  </select>              </td>
            </tr>
            <tr>
              <td class="tdcolor">是否反馈</td>
              <td colspan="3"><select name="is_Feedback">
              	<option value="否" selected="selected">未反馈</option>
              	<c:if test="${PlanByPlanId.is_Feedback=='是' }">
                <option value="是" selected="selected">已反馈</option>
                </c:if>
                <c:if test="${PlanByPlanId.is_Feedback!='是' }">
                <option value="是">已反馈</option>
                </c:if>
              </select></td>
            </tr>
            <tr>
              <td class="tdcolor">反馈信息</td>
              <td colspan="3"><label>
                <textarea name="feedback_Info" cols="60" rows="4">${PlanByPlanId.feedback_Info}</textarea>
              </label></td>
            </tr>
        </table>


		  <p>
              		<input name="Submit" type="reset" class="menu2" value="取消" />
					<input name="Submit" type="submit" class="menu1" value="提交" />
          </p>
      </form>
      </div>
    </td></tr>
</table>
<!-- #BeginLibraryItem "/Library/bottom.lbi" --><div id="bottom"><img src="images/button.jpg" width="1002" height="17" /></div><!-- #EndLibraryItem -->
</body>

</html>
