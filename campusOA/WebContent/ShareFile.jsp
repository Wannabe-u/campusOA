<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>共享文件</title>
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
			<h3>共享文件</h3>
		</div>
	</div>
	
	<div class="well well-sm">
		<div style="padding: 10px 10px 10px;">
			<form class="bs-example bs-example-form" role="form">
				<div class="input-group">
					<select id="index" class="form-control">
			            <option selected="selected">标题</option>
			            <option>上传者</option>
			            <option>类型</option>
		        	</select>
					
					<div class="input-group-btn"></div><!-- /btn-group -->
					
	                <div class="input-group">
	                    <input type="text" class="form-control" id="key">
	                    <span class="input-group-btn">
	                        <button class="btn btn-default" type="button" id="scan">搜索</button>
	                    </span>
	                </div><!-- /input-group -->
		            
				</div><!-- /input-group -->
			</form>
		</div>
	</div>
	<div class="panel panel-default">
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>标题</th>
						<th>上传者</th>
						<th>上传时间</th>
						<th>类型</th>
						<th>简述</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${FileList}" var="sk" varStatus="status">
					<tr class="active">
						<td>${sk.title}</td>
						<td>${sk.number}</td>
						<td>${sk.releaseTime}</td>
						<td>${sk.fileType}</td>
						<td>
							<button type="button" class="btn btn-defaulty btn-sm" data-toggle="button" onclick="downloadFile('${sk.fileType}', ${sk.fileId})">
								<span class="glyphicon glyphicon-folder-open"></span> 下载
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
	
   function downloadFile(fileType, fileId){
	   if(fileType=='视频') alert('在线学习中观看！');
	   else window.location.href=${pageContext.request.contextPath}/+"downloadFile?fileId="+fileId+"&User="+'${User}';
   };
   
   $(function(){
		$("#scan").bind("click",function(){
			var index = $("#index").val();
			var key = $("#key").val();
			window.location.href=${pageContext.request.contextPath}/+"ShareFile?User="+'${User}'+"&index="+index+"&key="+key;
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