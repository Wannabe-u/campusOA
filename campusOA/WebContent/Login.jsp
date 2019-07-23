<%@page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>登录</title>
	<link href="logo/xtu.ico" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="login/css/bootstrap-grid.min.css" /><!--CSS RESET-->
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="login/css/htmleaf-demo.css"><!--演示页面样式，使用时可以不引用-->
	
	<style>
		.demo{ padding: 20px 0;background: linear-gradient(to right,#7AB6B6 50%, #E5CFAA 50%); }

		.form-horizontal{
		    background-color: #fff;
		    font-family: 'Arimo', sans-serif;
		    text-align: center;
		    padding: 50px 30px 50px;
		    box-shadow: 12px 12px 0 0 rgba(0,0,0,0.3);
		}

		.form-horizontal .heading{
		    color: #555;
		    font-size: 30px;
		    font-weight: 600;
		    letter-spacing: 1px;
		    text-transform: capitalize;
		    margin: 0 0 50px 0;
		}

		.form-horizontal .form-group{
		    margin: 0 auto 30px;
		    position: relative;
		}

		.form-horizontal .form-group:nth-last-child(2){ margin-bottom: 20px; }

		.form-horizontal .form-group:last-child{ margin: 0; }

		.form-horizontal .form-group>i{
		    color: #999;
		    transform: translateY(-50%);
		    position: absolute;
		    left: 5px;
		    top: 50%;
		}

		.form-horizontal .form-control{
		    color: #7AB6B6;
		    background-color: #fff;
		    font-size: 17px;
		    letter-spacing: 1px;
		    height: 40px;
		    padding: 5px 10px 2px 25px;
		    box-shadow: 0 0 0 0 transparent;
		    border: none;
		    border-bottom: 1px solid rgba(0,0,0,0.1);
		    border-radius: 0;
		    display: inline-block;
		}

		.form-control::placeholder{
		    color: rgba(0,0,0,0.2);
		    font-size: 16px;
		}

		.form-horizontal .form-control:focus{
		    border-bottom: 1px solid #7AB6B6;
		    box-shadow: none;
		}

		.form-horizontal .btn{
		    color: #7AB6B6;
		    background-color: #EDF6F5;
		    font-size: 18px;
		    font-weight: 700;
		    letter-spacing: 1px;
		    border-radius: 5px;
		    width: 50%;
		    height: 45px;
		    padding: 7px 30px;
		    margin: 0 auto 25px;
		    border: none;
		    display: block;
		    position: relative;
		    transition: all 0.3s ease;
		}

		.form-horizontal .btn:focus,
		.form-horizontal .btn:hover{
		    color: #fff;
		    background-color: #7AB6B6;
		}

		.form-horizontal .btn:before,
		.form-horizontal .btn:after{
		    content: '';
		    background-color: #7AB6B6;
		    height: 50%;
		    width: 2px;
		    position: absolute;
		    left: 0;
		    bottom: 0;
		    z-index: 1;
		    transition: all 0.3s;
		}

		.form-horizontal .btn:after{
		    bottom: auto;
		    top: 0;
		    left: auto;
		    right: 0;
		}

		.form-horizontal .btn:hover:before,
		.form-horizontal .btn:hover:after{
		    height: 100%;
		    width: 50%;
		    opacity: 0;
		}

		.form-horizontal .create_account{
		    color: #D6BC8B;
		    font-size: 16px;
		    font-weight: 600;
		    display: inline-block;
		}

		.form-horizontal .create_account:hover{
		    color: #7AB6B6;
		    text-decoration: none;
		}
	</style>
</head>
<body>
<div class="htmleaf-container">
	<header class="htmleaf-header">
		<div style="margin-top: 50px">
		<h1>校园协同办公系统 </h1>
		</div>
	</header>
	 <div class="demo form-bg">
        <div class="container">

            <div class="row">
                <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6">
                    <form class="form-horizontal">
                        <div class="heading">用户登录</div>
                        <div class="form-group">
                            <i class="fa fa-user"></i><input required name="login[username]" type="text" class="form-control" placeholder="Username" id="username"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock"></i><input required name="login[password]" type="password" class="form-control" placeholder="Password" id="password"/>
                        </div>
                        <div class="form-group">
                            <button id="Login" type="submit" class="btn btn-default"><i class="fa fa-arrow-right"></i></button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
	
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#Login").click(function(){
			var username = $("#username").val();
			var password = $("#password").val();
			//alert(username+" "+password);
			if(username=='') alert("学号不能为空！");
			else if(password=='') alert("密码不能为空！");
			else{
				$.ajax({
					url: "Login",
					dataType: "text",
					data: {
						username: username,
						password: password
					},
					success: function(result){
						//alert(result);
						if(result!='管理员'){
							//alert(result);
							window.location.href=${pageContext.request.contextPath}/+'MessageList?User='+username+'&index=All&key=#';
						}
						else if(result=='管理员'){
							//alert(result);
							window.location.href=${pageContext.request.contextPath}/+"UserList?User="+username;
						}
						else alert(result);
					},
					error: function(status){
						alert(status);
					}
				})
			}
			
		})
	})

</script>
</body>
</html>

