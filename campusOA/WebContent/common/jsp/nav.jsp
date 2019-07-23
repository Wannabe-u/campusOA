<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="common/css/main.css">


<div id="main">
      <h3 id="title1">公告</h3>
	  <div id="box">
		<ul id="con1">
			<c:forEach items="${messageList}" var="sk" varStatus="status">
			<li><a href="#">${sk.title}:${sk.content}</a></li><br>
			<li><span>-${sk.releaseTime}</span></li>
			 </c:forEach> 
		</ul>
		<ul id="con2">
		</ul> 
 　 	 </div> 
</div>

<div class="middle">
	<!-- 菜单-开始 -->
	<div class="leftMenu">
		<div class="topMenu">
		<img class="banshi" src="common/img/logo.png" />
		</div>
		<div class="menu_list">
			<ul>
				<li class="lis">
					<p class="fuMenu"><span class="glyphicon glyphicon-user"></span> ${realname}</p>
				</li>
				<li class="lis">
					<a class="fuMenu" onclick="logout('${User}')">退出登录</a>
				</li>
				<li class="lis">
					<p class="fuMenu">个人中心</p>
					<img class="xiala" src="common/img/xiala.png" />
					<div class="div1">
						<a class="zcd" id="zcd1" href="${pageContext.request.contextPath}/UserInfo?User=${User}">查看信息</a>
						<a class="zcd" id="zcd2" href="${pageContext.request.contextPath}/UpdateUserInfo?User=${User}">修改信息</a>
						<a class="zcd" id="zcd3" href="${pageContext.request.contextPath}/UpdatePassword?User=${User}">修改密码</a>
					</div>
				</li>
				<li class="lis">
					<p class="fuMenu">文件管理</p>
					<img class="xiala" src="common/img/xiala.png" />
					<div class="div1">
						<a class="zcd" id="zcd9" href="${pageContext.request.contextPath}/UploadShareFile?User=${User}">上传文件</a>
						<a class="zcd" id="zcd10" href="${pageContext.request.contextPath}/ShareFile?User=${User}&index=All&key=#">查看文件</a>
					</div>
				</li>
				<li class="lis">
					<p class="fuMenu">审批流转</p>
					<img class="xiala" src="common/img/xiala.png" />
					<div class="div1">
						<a class="zcd" id="zcd19" href="${pageContext.request.contextPath}/LeaveBill?User=${User}">请假审批</a>
						<a class="zcd" id="zcd19" href="${pageContext.request.contextPath}/LeaveBillList?User=${User}">假条状态</a>
						<a class="zcd" id="zcd20" href="${pageContext.request.contextPath}/OfficialDocument?User=${User}">公文审批</a>
						<a class="zcd" id="zcd19" href="${pageContext.request.contextPath}/OfficialDocumentList?User=${User}">公文状态</a>
					</div>
				</li>
				<li class="lis">
					<a class="fuMenu" href="${pageContext.request.contextPath}/Work?User=${User}">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp待办事项 <span class="badge">${listCount}</span></a>
				</li>
				<li class="lis">
					<a class="fuMenu" href="${pageContext.request.contextPath}/MessageList?User=${User}&index=All&key=#">公共信息</a>
				</li>
				
			</ul>
		</div>
	</div>
	<!-- 菜单-结束 -->
<script type="text/javascript">
var area = document.getElementById('box');
var con1 = document.getElementById('con1');
var con2 = document.getElementById('con2');
var speed = 40;
area.scrollTop = 0;
con2.innerHTML = con1.innerHTML;
function scrollUp(){
    if(area.scrollTop >= con1.scrollHeight) {
        area.scrollTop = 0;
    }else{
        area.scrollTop ++;
    }
}
var myScroll = setInterval("scrollUp()",speed);
area.onmouseover = function(){
    clearInterval(myScroll);
}
area.onmouseout = function(){
    myScroll = setInterval("scrollUp()",speed);
}
 
</script>
	
</div>
