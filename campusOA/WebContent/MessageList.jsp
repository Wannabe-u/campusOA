<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>消息列表</title>
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
<body >
<c:if test="${identity=='管理员'}"><%@ include file="common/jsp/navRoot.jsp" %></c:if>
<c:if test="${identity!='管理员'}"><%@ include file="common/jsp/nav.jsp" %></c:if>
<div class="container" >
	<div class="panel panel-info">
		<div class="panel-heading text-center">
			<h3>消息列表 <span style="font-size:25px"  class="badge">${mlc}</span></h3>
		</div>
	</div>
	
	<div class="well well-sm">
		<div style="padding: 10px 10px 10px;">
			<form class="bs-example bs-example-form" role="form">
				<div class="input-group">
					<select id="index" class="form-control">
			            <option selected="selected">标题</option>
			            <option>学号</option>
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
			<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
			     style="height:1080px;overflow:auto; position: relative;">
			     
			     <c:forEach items="${messageList}" var="sk" varStatus="status">
		        	<h4 id="ios">管理员&nbsp&nbsp&nbsp发布于：<span style="font-family:'STHupo','Microsoft YaHei',微软雅黑;font-size: 20px;font-weight:bold">${sk.releaseTime}</span></h4>
		        	<div class="panel panel-default">
					    <div class="panel-body">
					        <p style="font-family:'STKaiti','Microsoft YaHei',微软雅黑;font-size: 25px;"><span style="font-family:'STKaiti','Microsoft YaHei',微软雅黑;font-size: 20px;" class="label label-default">${sk.title}</span>&nbsp&nbsp&nbsp${sk.content}</p>
					    </div>
					</div>
		         </c:forEach> 
			</div>
		</div>
		
	</div>
	<div class="panel-footer">---校园协同办公系统---</div>
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
  	
    $(function(){
		$("#scan").bind("click",function(){
			var index = $("#index").val();
			var key = $("#key").val();
			window.location.href=${pageContext.request.contextPath}/+"MessageList?User="+'${User}'+"&index="+index+"&key="+key;
		});
	});
</script>
</body>
</html>