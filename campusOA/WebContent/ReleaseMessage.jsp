<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>发布公告</title>
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
			<h3>发布消息</h3>
		</div>
	</div>
	<div class="panel panel-default">
	    <div class="panel-body">
		<form class="" id="ReleaseMessage">
		<div class="form-group">
			<label for="title" class="col-sm-1 control-label">标题</label>
			<div class="col-sm-5">
				<input id="title" class="form-control" name="title" type="text" placeholder="请输入标题(字符长度小于40)">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="content" class="col-sm-1 control-label">内容</label>
			<div class="col-sm-5">
				<textarea id="content" name="content" style="height: 150px;width: 400px;"></textarea>
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<div class="col-sm-6">
			<p>
			  <button id="" type="submit" class="btn btn-primary">提交</button>
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
			url: "commitMessage",
			dataType: "text",
			data: {
				User: '${User}',
				title: $("#title").val(),
				content: $("#content").val()
			},
			success: function(data){
				alert(data);
			}
		});
    }
});

$().ready(function(){
	$("#ReleaseMessage").validate({
		rules: {
			title: {
				required: true,
				maxlength: 40
			},
			content: {
				required: true
			}
		}
	});
});
function logout(User){
	if(confirm("确定退出！")){
		window.location=${pageContext.request.contextPath}/;
	}
}
</script>
</body>
</html>