<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>更改密码</title>
<!-- 通用样式 -->
<link rel="stylesheet" type="text/css" href="common/css/public.css"/>
<!-- 动态菜单CSS -->
<link rel="stylesheet" type="text/css" href="common/css/menu.css"/>
<link rel="stylesheet" type="text/css" href="common/css/mian.css"/>
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
<div class="container" >
	
	<div class="panel panel-info">
		<div class="panel-heading text-center">
			<h3>用户信息</h3>
		</div>
	</div>
	<div class="panel panel-default">
	    <div class="panel-body">
	    <form class="" role="form" id="updatePassword">
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">旧密码</label>
				<div class="col-sm-5">
					<input id="oldPassword" class="form-control" name="oldPassword" type="password" placeholder="请输入您的登录密码">
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">新密码</label>
				<div class="col-sm-5">
					<input id="newPassword" class="form-control" name="newPassword" type="password" placeholder="请设置您的新密码(字符长度小于32)">
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			<div class="form-group">
				<label for="confirmPassword" class="col-sm-2 control-label">重复密码</label>
				<div class="col-sm-5">
					<input id="confirmPassword" class="form-control" name="confirmPassword" type="password" placeholder="请再次输入新密码">
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			
			<div class="form-group">
				<div class="col-sm-7">
				<p>
				  <button type="submit" class="btn btn-primary">提交更改</button>
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

$.validator.setDefaults({
    submitHandler: function() {
		$.ajax({
			url: "commitUpdatePassword",
			dataType: "text",
			data: {
				User: '${User}',
				oldPassword: $("#oldPassword").val(),
				newPassword: $("#newPassword").val(),
				confirmPassword: $("#confirmPassword").val()
			},
			success: function(data){
				if(data=='密码修改成功,请重新登录!')
					window.location.href=${pageContext.request.contextPath}/;
				alert(data);
			}
		});
    }
});	

$().ready(function(){
	$("#updatePassword").validate({
		rules: {
			oldPassword: {
				required: true,
				rangelength: [6,32]
			},
			newPassword: {
				required: true,
				rangelength: [6,32]
			},
			confirmPassword: {
				required: true,
				rangelength: [6,32],
				equalTo: "#newPassword"
			}
		},
		messages: {
			oldPassword: {
				required: "请输入您的登录密码",
				rangelength: "密码长度6-32(包含大写、小写和数字)"
			},
			newPassword: {
				required: "请设置您的新密码",
				rangelength: "密码长度6-32(包含大写、小写和数字)"
			},
			confirmPassword: {
				required: "请输入您设置的新密码",
				rangelength: "密码长度6-32(包含大写、小写和数字)",
				equalTo: "两次密码输入不一致"
			}
		}
	});
});
function logout(User){
	if(confirm("确定退出！")){
		//window.location=logoutUrl;
		window.location=${pageContext.request.contextPath}/;
	}
}
</script>

</body>
</html>