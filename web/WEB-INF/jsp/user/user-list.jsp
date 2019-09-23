<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="IE=edge, chrome=1">
	<title>사용자 관리</title>
	<link href="${pageContext.request.contextPath}/resources/static/css/base.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/static/css/jquery-ui.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/static/css/main.css" rel="stylesheet" type="text/css">

	<script src="${pageContext.request.contextPath}/resources/static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/jquery-ui.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/datatables/set-dataTables.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/datatables/simple_numbers_no_ellipses.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/ui.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			(function(){
				// Start, End date setting
				startEndDate(".start-date", ".end-date");

				// reference-- https://datatables.net/ 
				// https://datatables.net/upgrade/1.10-convert#Options
				var oTable = $(".data-table").DataTable({
					"ajax": {
						"url": "user-list.json",
						"type": "GET",
						"data": function(d){
							// use for search filter: sending search filter to the server.
							// eg.)
							// d.userName = $(input[name="userName"]).val();
							// d.OOO = $('select[name=""]').val(); 
						},
						beforeSend: function(){
							loadingStart();
						},
						complete: function(){
							loadingStop();
						}
					},
					"columns": [
						{ "data": "data1" },
						{ "data": "data2" },
						{ "data": "data3" },
						{ "data": "data4" },
						{ "data": "data5" },
						{ "data": null }
					],
					"createdRow": function (row, data, dataIndex){
						var $cell = $(row).find("td");
						var seq = data.seq;
						var title = data.data1;
						var url = "url/"+seq;
						var link = "<div class='ellipsis'><a class='link' href='"+ +"' data-btn='link' title='"+ title +"'>"+ title +"</a></div>";
						var btnDelete = "<button type='button' class='delete' data-btn='delete' data-seq='"+ seq +"' title='Delete'>Delete</button>";

						$cell.eq(0).html(link);
						$cell.eq(5).html(btnDelete);
					}
				});
			
				$(".dataTables_length label select").addClass("form-select select-change"); 
				$(".dataTables_length label").append("<span class='select-arrow'>10</span>");
				$(".length-wrap").append("<a href='#' class='btn btn2 add' data-btn='new'>New User</a>"); 

				// relaod datatables
				function reLoadTable(){
					oTable.ajax.reload();
				}

				
				function reDrawTable(){
					oTable.draw(false);
				}
				
				// delete message popup
				var deleteSeq = "";
				var deleteDialog = $("#deleteDialog").dialog({
					title: "Delete",
					width: 400,
					buttons: [
						{
							text: "Cancel",
							class: "btn1",
							click: function(){
								$(this).dialog("close");
							}
						},
						{
							text: "OK",
							class: "btn2",
							click: function(){
								alert(deleteSeq);
								$(this).dialog("close");
							}
						}
					],
					close: function(){
						deleteSeq = '';
					}
				});
				
				resizeDialogPosition();

				// Search
				$("[data-btn='search']").on("click", function(){
					reLoadTable();
				});

				// open delete message popup
				$(document).on("click", "[data-btn='delete']", function(){
					deleteSeq = $(this).attr("data-seq");
					deleteDialog.dialog("open");
				});
			}());
		});
	</script>
</head>
<body>
	<!-- #wrap -->
	<div id="wrap">  
		<!-- #header -->
		<div id="side">
			<header id="header">
				<div class="user-account">
					<h2 class="blind-position">User Information</h2>
					<div>
						<img src="${pageContext.request.contextPath}/resources/static/img/avatar.png" alt=" ">
					</div>
					<div>
						<a href="#" class="user-name">Admin(K&LSoft)</a>
					</div>
					<div>
						<a href="#" class="logout">Logout</a>
					</div>
				</div>
			</header>
			<nav class="gnb">
				<h2 class="blind-position">Menu</h2>		
				<ul class="menu"> <!--- reference: ui.js -> data-href -->
					<li>
						<a href="#" data-href="/staff/">Staff Management</a>	
					</li>
					<li>
						<a href="#" data-href="/user/">User Management</a>
					</li>
					<li>
						<a href="#" data-href="/project/">Project Management</a>	
					</li>
					<li>
						<a href="#" data-href="/attendance/">Attendance Management</a>	
					</li>
				</ul>
			</nav>
		</div>
		<!-- /#header -->
		<!-- #contents -->
		<section id="contents"> 
			<header class="cont-header">
				<h1 class="title">
					<a href="#" id="logo">
						<img src="${pageContext.request.contextPath}/resources/static/img/main-logo.png" style="width:200px;height:30px;" alt="Kim & Lim Soft">
					</a>
					<span>User Management</span>
				</h1>
				<ul class="location clearfix">
					<li><a href="#">Home</a></li>
					<li class="arrow">&gt;</li>
					<li>User Management</li>
				</ul>
			</header>
			<div class="row">
				<div class="search clearfix">
					<form autocomplete="off">
						<div class="inline-table">
							<div class="tr">
								<div class="th">
									<label class="label">Name</label>
								</div>
								<div class="td">
									<div class="input-box">
										<input class="form-input" type="text" name=""/>
									</div>
								</div>
								<div class="th">
									<label class="label">ID</label>
								</div>
								<div class="td">
									<div class="input-box">
										<input class="form-input" type="text" name=""/>
									</div>
								</div>
							</div>
							<div class="tr">
								<div class="th">
									<label class="label">User Role</label>
								</div>
								<div class="td">
									<div class="select-box">
										<select class="form-select select-change" name="">
											<option value="">All</option>
											<option value="">User</option>
											<option value="">Admin</option>
										</select>
										<span class="select-arrow">All</span> 
									</div>
								</div>
								<div class="th">
									<label class="label">Register Date</label>
								</div>
								<div class="td">
									<div class="date-box">
										<input class="form-input datepicker start-date" type="text" name="" readonly/>
										<span class="dash">-</span>
										<input class="form-input datepicker end-date" type="text" name="" readonly/>
									</div>
								</div>
								<div class="td btn-cell">
									<button type="button" class="btn btn3" data-btn="search">Search</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="table-style list-table">
					<table class="data-table">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<col width="30%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>User Role</th>
								<th>Email</th>
								<th>Register Date</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- /#contents -->
	</div>
	<!-- /#wrap -->

	<!-- delete alert -->
	<div id="deleteDialog">
		<p class="alert-msg">Selected user will be delete.</p>
	</div>
	<!-- /delete alert -->
	
	<div class="data-process">
		<div class="data-process-in">
			<div class="process"><img src="${pageContext.request.contextPath}/resources/static/img/loading.gif" alt="로딩중..."></div>
		</div>
	</div>
</body>
</html>