<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>更改信息</title>
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
		<form class="" role="form" id="userinfo">
		
		<div class="form-group">
			<label for="number" class="col-sm-1 control-label">学号</label>
			<div class="col-sm-5">
				<input id="number" class="form-control" name="number" type="text" value="${user.number}">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="realName" class="col-sm-1 control-label">姓名</label>
			<div class="col-sm-5">
				<input id="realName" class="form-control" name="realName" type="text" value="${user.realName}">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="group" class="col-sm-1 control-label">院系</label>
			<div class="col-sm-5">
				<select id="faculty" class="form-control" name="faculty">
					<option selected="selected">${user.faculty}</option>
					<option>碧泉书院</option>
					<option>商学院</option>
					<option>公共管理学院</option>
					<option>法学院</option>
					<option>知识产权学院</option>
					<option>信用风险管理学院</option>
					<option>马克思主义学院(毛泽东学院)</option>
					<option>文学与新闻学院</option>
					<option>外国语学院</option>
					<option>数学与计算科学学院</option>
					<option>物理与光电工程学院</option>
					<option>材料科学与工程学院</option>
					<option>化学学院</option>
					<option>化工学院</option>
					<option>机械工程学院</option>
					<option>信息工程学院</option>
					<option>土木工程与力学学院</option>
					<option>环境与资源学院</option>
					<option>体育教学部</option>
					<option>艺术学院</option>
					<option>国际交流学院</option>
					<option>兴湘学院</option>
					<option>湘潭大学</option>
				</select>
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		
		<div class="form-group">
			<div class="col-sm-6">
			<p>
			  <button type="submit" class="btn btn-primary" onclick="">提交更改</button>
			</p>
			</div>
		</div>
		
		</form>
		
		</div>
	</div>
	
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="common/js/nav.js"></script>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">

$.validator.setDefaults({
    submitHandler: function() {
  		$.ajax({
			url: "commitUpdate",
			dataType: "text",
			data: {
				User: '${User}',
				account: $("#number").val(),
				realName: $("#realName").val(),
				faculty: $("#faculty").val(),
				department: $("#department").val()
			},
			success: function(data){
				alert(data);
			}
		});
    }
});	

$().ready(function(){
	$("#userinfo").validate({
		rules: {
			number: {
				required: true,
				maxlength: 30
			},
			realName: {
				required: true,
				rangelength: [2,4]
			},
			faculty: {
				required: true
			},
			department: {
				required: true
			}
		},
		messages: {
			number: {
				required: "请设置您的用户名",
				maxlength: "用户名长度不得超过30位"
			},
			realName: {
				required: "请输入您的中文名字",
				rangelength: "请输入合法的中文名字，2-4位的汉字"
			},
			faculty: {
				required: "请选择一个院系"
			},
			department: {
				required: "请输入一个部门"
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