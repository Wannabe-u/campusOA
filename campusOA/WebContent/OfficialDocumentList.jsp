<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>公文列表</title>
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
			<h3>公文列表   <span style="font-size:10px" class="label label-success">已通过：${lbc}</span>
						<span style="font-size:10px" class="label label-danger">未通过：${lbc1}</span>
						<span style="font-size:10px" class="label label-primary">审核中：${lbb}</span></h3>
		</div>
	</div>
	
	<div class="panel panel-default">
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table" >
				<thead>
					<tr>
						<th>标题</th>
						<th>申请时间</th>
						<th>一级部门</th>
						<th>二级部门</th>
						<th>状态</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${OfficialDocumentList}" var="sk" varStatus="status">
				<c:if test="${sk.state == '未通过'}">
					<tr  class = danger>
						<td>${sk.title}</td>
						<td>${sk.applyTime}</td>
						<td>${sk.superiorReply}</td>
						<td>${sk.bossReply}</td>
						<td>${sk.state}</td>
						<td>
							<button type="button" class="btn btn-default popover-options" 
									title="请再次点击收回！" data-container="body" 
									data-toggle="消息内容" data-placement="right" 
									data-content="${sk.description}">
								查看
							</button>
						</td>
					</tr>
					</c:if>
					<c:if test="${sk.state == '审核中'}">
					<tr  class = info>
						<td>${sk.title}</td>
						<td>${sk.applyTime}</td>
						<td>${sk.superiorReply}</td>
						<td>${sk.bossReply}</td>
						<td>${sk.state}</td>
						<td>
							<button type="button" class="btn btn-default popover-options" 
									title="请再次点击收回！" data-container="body" 
									data-toggle="消息内容" data-placement="right" 
									data-content="${sk.description}">
								查看
							</button>
						</td>
					</tr>
					</c:if>
					<c:if test="${sk.state == '通过'}">
					<tr  class = success>
						<td>${sk.title}</td>
						<td>${sk.applyTime}</td>
						<td>${sk.superiorReply}</td>
						<td>${sk.bossReply}</td>
						<td>${sk.state}</td>
						<td>
							<button type="button" class="btn btn-default popover-options" 
									title="请再次点击收回！" data-container="body" 
									data-toggle="消息内容" data-placement="right" 
									data-content="${sk.description}">
								查看
							</button>
						</td>
					</tr>
					</c:if>
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