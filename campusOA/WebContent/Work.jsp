<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>待办事务</title>
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
			<h3>待办事务</h3>
		</div>
	</div>
	
	<div class="panel panel-default">
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>事务</th>
						<th>学号</th>
						<th>姓名</th>
						<th>一级部门</th>
						<th>二级部门</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${documentList}" var="sk" varStatus="status">
					<tr class="info">
						<td>公文</td>
						<td>${sk.number}</td>
						<td>${sk.realName}</td>
						<td>${sk.superiorReply}</td>
						<td>${sk.bossReply}</td>
						<td> 
						<button id="btn_content" class="btn btn-info" type="button" onclick="window.location='${pageContext.request.contextPath}/OPdocument?User=${User}&userId=${sk.userId}&documentId=${sk.documentId}'">
					        <span class="glyphicon glyphicon-eye-open"> 更多操作</span>
					    </button>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${leaveList}" var="sk" varStatus="status">
					<tr class="info">
						<td>假条</td>
						<td>${sk.number}</td>
						<td>${sk.realName}</td>
						<td>${sk.superiorReplyReason}</td>
						<td>${sk.bossReplyReason}</td>
						<td> 
						<button id="btn_content" class="btn btn-info" type="button" onclick="window.location='${pageContext.request.contextPath}/OPleave?User=${User}&userId=${sk.userId}&leaveId=${sk.leaveId}'">
					        <span class="glyphicon glyphicon-eye-open"> 更多操作</span>
					    </button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	
</div>

<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
   
   function logout(User){
		if(confirm("确定退出！")){
			//window.location=logoutUrl;
			window.location=${pageContext.request.contextPath}/;
		}
	}
   
   $(function () { $('.popover-show').popover('show');});
	$(function () { $('.popover-hide').popover('hide');});
	$(function () { $('.popover-destroy').popover('destroy');});
	$(function () { $('.popover-toggle').popover('toggle');});
	$(function () { $(".popover-options").popover({html : true });});
</script>
	
</body>
</html>