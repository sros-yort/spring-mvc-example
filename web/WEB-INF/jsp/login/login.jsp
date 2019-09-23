<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="IE=edge, chrome=1">
	<title>로그인</title>
	<link href="" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/static/css/base.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/static/css/main.css" rel="stylesheet" type="text/css">

	<script src="${pageContext.request.contextPath}/resources/static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/ui.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			(function(){
				
				var $id = $("input[name='id']");
				var $pw = $("input[name='pw']");

				// 로그인
				$('[data-btn="login"]').on("click", function(){
					var $this = $(this);
					var id = $id.val();
					var pw = $pw.val();

					$this.prop("disabled", true); // disable button click
					
					if(id == null || id === ""){
						validationError($id, $this, "ID is required.");
						return false;
					}

					if(pw == null || pw === ""){
						validationError($pw, $this, "Password is required.");
						return false;
					}

					/*$.ajax({
						url: "",
						type: "POST",
						data: "",
						success: function(data) {
							if(data.status == "200"){
								//Login success, move to next page	
							}else{
								alert("Invalid user id or password.");
								}
							} 
						},
						beforeSend:function() {
							loadingStart();
						},
						complete: function() {
							loadingStop();
							$this.prop("disabled", false);
						}
					});*/
				});

			}());
		});
	</script>
</head>
<body class="login">
	<!-- #wrap -->
	<div id="wrap">
		<!-- #contents -->
		<div id="contents">
			<section class="cont clearfix">
				<header class="cont-right">
					<h1 id="logo">
						<span class="blind-position">Staff Management</span>
						<img src="${pageContext.request.contextPath}/resources/static/img/klsoft.png" style="width:300px;height:200px;" alt=" "/>
					</h1>
				</header>
				<div class="cont-left">
					<form autocomplete="off">
						<label class="blind-position">ID</label>
						<div class="form-group">
							<div class="input-box">
								<input class="form-input" type="text" name="id" placeholder="User ID" autofocus/>
							</div>
						</div>
						<label class="blind-position ">Password</label>
						<div class="form-group">
							<div class="input-box">
								<input class="form-input" type="password" name="pw" placeholder="Password"/>
							</div>
						</div>
						<div class="form-actions">
							<button type="button" class="btn" data-btn="login">Login</button>
						</div>
					</form>
				</div>
			</section>
		</div> 
		<!-- /#contents -->
	</div>
	<!-- /#wrap -->

	<footer id="footer">
		<p class="copy">2019 &copy; ALL RIGHTS RESERVED</p>
	</footer>
	
	<div class="data-process">
		<div class="process"><img src="${pageContext.request.contextPath}/resources/static/img/loading.gif" alt="로딩중..."></div>
	</div>
</body>
</html>