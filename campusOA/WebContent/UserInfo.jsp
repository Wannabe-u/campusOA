<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户信息</title>
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
		<form class="" role="form">
			<div class="form-group">
				<label for="username" class="col-sm-1 control-label">学号</label>
				<div class="col-sm-5">
					<input id="username" class="form-control" name="username" type="text" value="${user.number}" disabled>
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<div class="form-group">
				<label for="realName" class="col-sm-1 control-label">姓名</label>
				<div class="col-sm-5">
					<input id="realName" class="form-control" name="realName" type="text" value="${user.realName}" disabled>
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<div class="form-group">
				<label for="identity" class="col-sm-1 control-label">身份</label>
				<div class="col-sm-5">
					<input id="identity" class="form-control" name="identity" type="text" value="${user.identity}" disabled>
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			
			<div class="form-group">
				<label for="email" class="col-sm-1 control-label">院系</label>
				<div class="col-sm-5">
					<input id="email" class="form-control" name="email" type="text" value="${user.faculty}" disabled>
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			
			<div class="form-group">
				<label for="email" class="col-sm-1 control-label">部门</label>
				<div class="col-sm-5">
					<input id="email1" class="form-control" name="email" type="text" value="${user.department}" disabled>
				</div>
			</div>
			
		</form>
		</div>
	</div>
</div>
	
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

function logout(User){
	if(confirm("确定退出！")){
		window.location=${pageContext.request.contextPath}/;
	}
}
</script>
</body>
</html>