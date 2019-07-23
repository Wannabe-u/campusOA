<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>导入用户</title>
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
<div class="container">
	<div class="panel panel-info">
		<div class="panel-heading text-center">
			<h3>导入用户</h3>
		</div>
	</div>
	<div class="panel panel-default">
	    <div class="panel-body">
	    <form class="" role="form" id="Register">
		<div class="form-group">
			<label for="number" class="col-sm-2 control-label">学号</label>
			<div class="col-sm-5">
				<input id="number" class="form-control" name="number" type="text" placeholder="请输入您的学号(字符长度小于30)">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="realName" class="col-sm-2 control-label">姓名</label>
			<div class="col-sm-5">
				<input id="realName" class="form-control" name="realName" type="text" placeholder="请输入您的姓名(字符长度小于20)">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="identity" class="col-sm-2 control-label">职位</label>
			<div class="col-sm-5">
				<select id="identity" class="form-control" name="identity">
					<option selected="selected">讲师</option>
					<option>副教授</option>
					<option>教授</option>
					<option>主任</option>
					<option>处长</option>
					<option>书记</option>
					<option>副院长</option>
					<option>院长</option>
					<option>校长</option>
				</select>
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-5">
				<input id="password1" class="form-control" name="password1" type="password" placeholder="请设置您的密码(字符长度小于32)">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="confirmPassword" class="col-sm-2 control-label">重复密码</label>
			<div class="col-sm-5">
				<input id="confirmPassword" class="form-control" name="confirmPassword" type="password" placeholder="请再次输入密码">
			</div>
		</div>
		<div class="alert alert-defaulty" style="text-align: center;"></div>
		<br>
		<div class="form-group">
			<label for="group" class="col-sm-2 control-label">院系</label>
			<div class="col-sm-5">
				<select id="faculty" class="form-control" name="faculty">
					<option selected="selected">请选择院系</option>
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
			<label for="department" class="col-sm-2 control-label">部门</label>
			<div class="col-sm-5">
				<select id="department" class="form-control" name="department">
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
			<div class="col-sm-7">
			<p>
			  <button id="submit" type="submit" class="btn btn-primary">导入</button>
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
			url: "commitRegister",
			dataType: "text",
			data: {
				User: '${User}',
				number: $("#number").val(),
				realName: $("#realName").val(),
				identity: $("#identity").val(),
				password1: $("#password1").val(),
				confirmPassword: $("#confirmPassword").val(),
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
	$("#Register").validate({
		rules: {
			number: {
				required: true,
				maxlength: 30
			},
			realName: {
				required: true,
				rangelength: [2,4]
			},
			identity: {
				required: true
			},
			password1: {
				required: true,
				rangelength: [6,32]
			},
			confirmPassword: {
				required: true,
				rangelength: [6,32],
				equalTo: "#password1"
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
				required: "请设置您的学号",
				maxlength: "用户名长度不得超过10位"
			},
			realName: {
				required: "请输入您的中文名字",
				rangelength: "请输入合法的中文名字，2-4位的汉字"
			},
			identity: {
				required: "请选择一个职位"
			},
			password1: {
				required: "请设置您的密码",
				rangelength: "密码长度6-32(包含大写、小写和数字)"
			},
			confirmPassword: {
				required: "请输入您设置的密码",
				rangelength: "密码长度6-32(包含大写、小写和数字)",
				equalTo: "两次密码输入不一致"
			},
			faculty: {
				required: "请选择一个院系"
			},
			department: {
				required: "请选择一个部门"
			}
		}
	});
});
 </script>

</body>
</html>