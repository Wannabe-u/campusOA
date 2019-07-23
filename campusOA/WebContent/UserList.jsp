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

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
<link href="logo/xtu.ico" rel="shortcut icon" type="image/x-icon"/>
</head>
<body style="background-color: #EEEEEE">
<c:if test="${identity=='管理员'}"><%@ include file="common/jsp/navRoot.jsp" %></c:if>
<c:if test="${identity!='管理员'}"><%@ include file="common/jsp/nav.jsp" %></c:if>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading text-center">
				<h3>用户信息列表</h3>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>职位</th>
						<th>院系</th>
						<th>部门</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${userList}" var="sk" varStatus="status">
					<tr class="info">
						<td>${sk.number}</td>
						<td>${sk.realName}</td>
						<td>${sk.identity}</td>
						<td>${sk.faculty}</td>
						<td>${sk.department}</td>
						<td>
							<button type="button" class="btn btn-primary" data-toggle="button" onclick="window.location='${pageContext.request.contextPath}/UpdateUser?User=${User}&number=${sk.number}'">
								编辑用户
							</button> 
						</td>
						<td>
							<button id="initPass" type="button" class="btn btn-primary" data-toggle="button" onclick="initPassword('${User}','${sk.number}')">
								重置密码
							</button> 
						</td>
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	</div>

<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
   	function initPassword(User,number){
	   var flag = confirm("确定重置"+number+"的密码!");
       if(flag){
    	   $.ajax({
   			url: "initPassword",
   			dataType: "text",
   			data: {
   				User: User,
   				number: number
   			},
   			success: function(data){
   				alert(data);
   			}
   		});
      }
   };
   function logout(User){
		if(confirm("确定退出！")){
			//window.location=logoutUrl;
			window.location=${pageContext.request.contextPath}/;
		}
	}
</script>
	
</body>
</html>