$(document).ready(function(){
	if(judement=="1"){
	$("#rmLi").remove();
	$("#addLi").after("<li class=\"dropdown\">"+
            "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">"+
		        	"后台管理 <b class=\"caret\"></b>"+
		    "</a>"+
		    "<ul class=\"dropdown-menu\">"+
		    	"<li><a href=\""+inputUsersUrl+"\">批量导入用户</a></li>"+
		        "<li><a href=\""+RegisterUrl+"\">手动导入用户</a></li>"+
		        "<li><a href=\""+inputGroupUrl+"\">导入院系专业</a></li>"+
		        "<li><a href=\""+UserListUrl+"\">管理用户</a></li>"+
		        "<li><a href=\""+ShareFileUrl+"\">共享文件</a></li>"+
		        "<li><a href=\""+TaskUrl+"\">任务</a></li>"+
		        "<li><a href=\""+MessageUrl+"\">消息</a></li>"+
		    "</ul>"+
		"</li>");
	};
});

function toy(User){
	if(User=='root'){
		window.location=deleteUrl+"UserListRoot?User="+User+"&page=1";
	}
	else{
		$(function (){
		    $("[data-toggle='popover']").popover();
		});
	}
};

function logout(User){
	if(confirm("确定退出！")){
		window.location=logoutUrl;
	}
};

$(function(){
	$("#deleteUser").bind("click",function(){
		var userPassword = prompt("请输入您的密码:");
		if(userPassword!=null && userPassword!=""){
			
			$.ajax({
				url: "deleteUser",
				dataType: "text",
				data: {
					User: name,
					password: userPassword
				},
				success: function(result,status){
					if(result=="注销成功!"){
						alert("感谢您的使用,希望能帮你们宝贵的建议和问题反馈给我们!");
						window.location=deleteUrl;
					}
					else{
						alert(result);
					}
				}
			});
			//alert("您好!");
		}
	});
});
	