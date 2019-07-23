<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>上传文件</title>
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
			<h3>上传文件</h3>
		</div>
	</div>
	<div class="panel panel-default">
	    <div class="panel-body">
		<form class="" id="uploadFile">
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">上传者</label>
				<div class="col-sm-5">
					<input id="submitter" class="form-control" name="submitter" type="text" value="${User}" disabled>
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			<div class="form-group">
				<label for="realName" class="col-sm-2 control-label">标题</label>
				<div class="col-sm-5">
					<input id="title" class="form-control" name="title" type="text" placeholder="请输入标题(字符长度小于20)">
				</div>
			</div>
			<div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			<div class="form-group">
				<label for="idCard" class="col-sm-2 control-label">文件类型</label>
				<div class="col-sm-5">
					<select id="fileType" class="form-control" name="fileType">
						<option>文档</option>
						<option>图片</option>	
						<option>音频</option>
						<option>视频</option>
						<option>压缩文件</option>
						<option>其它</option>
					</select>
				</div>
			</div>
			 <div class="alert alert-defaulty" style="text-align: center;"></div>
			<br>
			<div class="form-group">
				<label for="confirmPassword" class="col-sm-2 control-label">文件</label>
				<div class="col-sm-5">
					<input class="" id="shareFile" type="file" value="文件" name="shareFile">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">&nbsp</label>
				<div class="col-sm-5">
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
				
				<div class="col-sm-6">
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
        formData.append('fileType',$("#fileType").val());
        formData.append('shareFile',$("#shareFile")[0].files[0]);
        $.ajax({
            type:"post",
            url:"commitShareFile",
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
			fileType: {
				required: true
			},
			shareFile: {
				required: true
			}
		},
		messages: {
			submitter: {
				required: "请输入您的用户名",
				maxlength: "用户名长度不得超过30位"
			},
			title: {
				required: "请设置您的标题",
				maxlength: "标题长度不得超过20位"
			},
			fileType: {
				required: "请选择文件类型"
			},
			shareFile: {
				required: "请选择上传文件"
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