<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>公文审批</title>
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
<link rel="stylesheet" href="common/css/main.css">
<link href="logo/xtu.ico" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<c:if test="${identity=='管理员'}"><%@ include file="common/jsp/navRoot.jsp" %></c:if>
<c:if test="${identity!='管理员'}"><%@ include file="common/jsp/nav.jsp" %></c:if>
<div class="container">
	<div class="panel panel-info">
		<div class="panel-heading text-center">
			<h3>公文审批</h3>
		</div>
	</div>
	<div class="panel panel-default">
	    <div class="panel-body">
		<form class="" id="uploadFile">
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">标题</label>
				<div class="col-sm-5">
					<input id="title" class="form-control" name="title" type="text" placeholder="请输入标题(字符长度小于20)" >
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			<div class="form-group">
				<label for="superior" class="col-sm-2 control-label">一级部门</label>
				<div class="col-sm-5">
					<select id="superior" class="form-control" name="superior">
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
				<label for="boss" class="col-sm-2 control-label">二级部门</label>
				<div class="col-sm-5">
					<select id="boss" class="form-control" name="boss">
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
				<label for="confirmPassword" class="col-sm-2 control-label">文件</label>
				<div class="col-sm-3">
					<input class="" id="shareFile" type="file" value="文件" name="shareFile">
					
				</div>
				<div class="col-sm-3">
					<div class="progress progress-striped">
				    <div id="progress-bar" class="progress-bar progress-bar-success" role="progressbar"
				         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				         style="width: 0%;">
				    </div>
					</div>
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">描述</label>
				<div class="col-sm-5">
					<textarea id="description" name="description" style="height: 150px;width: 400px;"></textarea>
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			<div class="form-group">
				
			<div class="col-sm-7">
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
    	var formData = new FormData();
        formData.append('submitter','${User}');
        formData.append('title',$("#title").val());
        formData.append('superior', $("#superior").val());
        formData.append('boss', $("#boss").val());
        formData.append('description',$("#description").val());
        formData.append('shareFile',$("#shareFile")[0].files[0]);
        $.ajax({
            type:"post",
            url:"commitOfficialDocument",
            async:true,
            contentType: false,    //这个一定要写
            processData: false, //这个也一定要写，不然会报错
            data:formData,
            dataType:'text',    //返回类型，有json，text，HTML。这里并没有jsonp格式，所以别妄想能用jsonp做跨域了。
            success:function(data){
            	//window.location.href=${pageContext.request.contextPath}/+"ShareFile";
                alert(data);
            },
            error:function(XMLHttpRequest, textStatus, errorThrown, data){
                alert(errorThrown);
            },
            xhr:function(){
            	myXhr = $.ajaxSettings.xhr();
            	if(myXhr.upload){
            		myXhr.upload.addEventListener('progress', function(e){
            			var loaded = e.loaded;
            			var total = e.total;
            			var percent = Math.floor(100*loaded/total)+"%";
            			console.log("已经上传了："+percent);
            			$("#progress-bar").css("width",percent);
            		}, false);
            		
            	}
            	return myXhr;
            }
        });
    }
});	

$().ready(function(){
	$("#uploadFile").validate({
		rules: {
			submitter: {
				required: true,
				maxlength: 10
			},
			title: {
				required: true,
				maxlength: 20
			},
			shareFile: {
				required: true
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