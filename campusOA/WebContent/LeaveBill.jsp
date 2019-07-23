<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>请假流转</title>
<!-- 通用样式 -->
<link rel="stylesheet" type="text/css" href="common/css/public.css"/>
<!-- 动态菜单CSS -->
<link rel="stylesheet" type="text/css" href="common/css/menu.css"/>
<!-- jquery引入 -->
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<!-- 动态菜单JS -->
<script type="text/javascript" src="common/js/menu.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link href="logo/xtu.ico" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<c:if test="${identity=='管理员'}"><%@ include file="common/jsp/navRoot.jsp" %></c:if>
<c:if test="${identity!='管理员'}"><%@ include file="common/jsp/nav.jsp" %></c:if>
<div class="container">
	<div class="panel panel-info">
		<div class="panel-heading text-center">
			<h3>请假流转</h3>
		</div>
	</div>
	<div class="panel panel-default">
	    <div class="panel-body">
	    <form class="" role="form" id="Register">
		<div class="form-group">
			<label for="number" class="col-sm-2 control-label">学号</label>
			<div class="col-sm-5">
				<input id="number" class="form-control" name="number" type="text" value="${User}" disabled="disabled">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="realName" class="col-sm-2 control-label">一级部门</label>
			<div class="col-sm-5">
				<select id="superior" class="form-control" name="superior">
					<option selected="selected">请选择部门</option>
					<c:forEach items="${departmentList}" var="sk" varStatus="status">
					<option>${sk.departmentName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="boss" class="col-sm-2 control-label">二级部门</label>
			<div class="col-sm-5">
				<select id="boss" class="form-control" name="boss">
					<option selected="selected">请选择部门</option>
					<c:forEach items="${departmentList}" var="sk" varStatus="status">
					<option>${sk.departmentName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="startTime" class="col-sm-2 control-label">开始时间</label>
			<div class="col-sm-5">
				<input id="startTime" class="form-control" name="startTime" type="date" placeholder="请设置您的密码(字符长度小于32)">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="endTime" class="col-sm-2 control-label">截止时间</label>
			<div class="col-sm-5">
				<input id="endTime" class="form-control" name="endTime" type="date" placeholder="请设置您的密码(字符长度小于32)">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="applyReason" class="col-sm-2 control-label">请假理由</label>
			<div class="col-sm-5">
				<textarea id="applyReason" name="applyReason" style="height: 150px;width: 400px;"></textarea>
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		
		<div class="form-group">
			<div class="col-sm-7">
			<p>
			  <button id="submit" type="submit" class="btn btn-primary">提交</button>
			</p>
			</div>
		</div>
		
		</form>
		

		</div>
	</div>
	
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">
function logout(User){
	if(confirm("确定退出！")){
		//window.location=logoutUrl;
		window.location=${pageContext.request.contextPath}/;
	}
}
//表单
$.validator.setDefaults({
    submitHandler: function() {
    	var $this = $(this);
		$.ajax({
			url: "commitLeaveBill",
			dataType: "text",
			data: {
				User: '${User}',
				superior: $("#superior").val(),
				boss: $("#boss").val(),
				startTime: $("#startTime").val(),
				endTime: $("#endTime").val(),
				applyReason: $("#applyReason").val()
			},
			success: function(data){
				alert(data);
			}
		});
    }
});	

$().ready(function(){
	$("#Register").validate({
		rules: {
			number: {
				required: true
			},
			superior: {
				required: true
			},
			boss: {
				required: true
			},
			startTime: {
				required: true
			},
			endTime: {
				required: true
			},
			applyReason: {
				required: true
			}
		}
	});
});
 </script>

</body>
</html>