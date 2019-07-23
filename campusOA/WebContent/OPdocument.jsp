<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>详细</title>
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
	<div class="panel panel-default">
	    <div class="panel-body">
			<form class="" role="form">
				<div class="panel panel-info">
					<div class="panel-heading text-center">
						<h3>详细</h3>
					</div>
				</div>
				<div class="form-group">
					<label for="number" class="col-sm-2 control-label">学号</label>
					<div class="col-sm-5">
						<input id="number" class="form-control" name="number" type="text" value="${list.number}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				<div class="form-group">
					<label for="realName" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-5">
						<input id="realName" class="form-control" name="realName" type="text" value="${list.realName}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				<div class="form-group">
					<label for="identity" class="col-sm-2 control-label">职位</label>
					<div class="col-sm-5">
						<input id="identity" class="form-control" name="identity" type="text" value="${list.identity}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<label for="faculty" class="col-sm-2 control-label">院系</label>
					<div class="col-sm-5">
						<input id="faculty" class="form-control" name="faculty" type="text" value="${list.faculty}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-5">
						<input id="title" class="form-control" name="title" type="text" value="${list.title}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<label for="applyTime" class="col-sm-2 control-label">申请时间</label>
					<div class="col-sm-5">
						<input id="applyTime" class="form-control" name="applyTime" type="text" value="${list.applyTime}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<label for="superior" class="col-sm-2 control-label">一级部门</label>
					<div class="col-sm-5">
						<input id="superior" class="form-control" name="superior" type="text" value="${list.superiorReply}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<label for="boss" class="col-sm-2 control-label">二级部门</label>
					<div class="col-sm-5">
						<input id="boss" class="form-control" name="boss" type="text" value="${list.bossReply}" disabled>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<label for="description" class="col-sm-2 control-label">描述</label>
					<div class="col-sm-5">
						<div class="well well-lg">${list.description}</div>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">公文附件</label>
					<div class="col-sm-5">
						<button type="button" class="btn btn-default" data-toggle="button" onclick="download('${list.documentId}')">
							<span class="glyphicon glyphicon-folder-open"></span> 下&nbsp载
						</button>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<div class="col-sm-7">
					<p>
						<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="button" onclick="agree('${list.documentId}', '${list.userId}')">
							<span class="glyphicon glyphicon-pencil"></span> 批准
						</button>
					</p>
					</div>
				</div>
				<div class="alert alert-defaulty" style="text-align: center;"></div>
				
				<div class="form-group">
					<div class="col-sm-7">
					<p>
						<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="button" onclick="NOagree('${list.documentId}', '${list.userId}')">
							<span class="glyphicon glyphicon-pencil"></span> 不批准
						</button>
					</p>
					</div>
				</div>
				
			</form>

		</div>
	</div>
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

  	function download(documentId){
      	window.location.href=${pageContext.request.contextPath}/+"download?documentId="+documentId+"&User=${User}";
  	};
  	function logout(User){
	if(confirm("确定退出！")){
		//window.location=logoutUrl;
		window.location=${pageContext.request.contextPath}/;
	}
}
function agree(documentId, userId){
     $.ajax({
         url:"agree",
         dataType:'text',
         data: {
        	 User: '${User}',
        	 userId: userId,
        	 documentId: documentId
         },
         success:function(data){
         	//window.location.href=${pageContext.request.contextPath}/+"Task?User="+'${User}';
             alert(data);
         },
         error:function(XMLHttpRequest, textStatus, errorThrown, data){
             alert(errorThrown);
         }            
     });

};

function NOagree(documentId, userId){
	var reason = prompt("请输入您的理由:");
	if(reason==""||reason==null) alert("理由不能为空!");
	else{
		$.ajax({
	        url:"Noagree",
	        dataType:'text',
	        data: {
	         User: '${User}',
	       	 userId: userId,
	       	 documentId: documentId,
	       	 reason: reason
	        },
	        success:function(data){
	        	//window.location.href=${pageContext.request.contextPath}/+"Task?User="+'${User}';
	            alert(data);
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown, data){
	            alert(errorThrown);
	        }            
	    });
	}
    

};
</script>
</body>
</html>