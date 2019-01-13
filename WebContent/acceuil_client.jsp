<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--
        ===
        This comment should NOT be removed.

        Charisma v2.0.0

        Copyright 2012-2014 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
        ===
    -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

<link href="css/charisma-app.css" rel="stylesheet">
<link href='bower_components/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet'>
<link href='bower_components/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print'>
<link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
<link href='bower_components/colorbox/example3/colorbox.css'
	rel='stylesheet'>
<link href='bower_components/responsive-tables/responsive-tables.css'
	rel='stylesheet'>
<link
	href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'
	rel='stylesheet'>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
<link href='css/elfinder.min.css' rel='stylesheet'>
<link href='css/elfinder.theme.css' rel='stylesheet'>
<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='css/uploadify.css' rel='stylesheet'>
<link href='css/animate.min.css' rel='stylesheet'>

<!-- jQuery -->
<script src="bower_components/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="img/favicon.ico">

</head>

<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			<button type="button" class="navbar-toggle pull-left animated flip">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.php"> <img
				alt="Charisma Logo" src="img/logo20.png" class="hidden-xs" /> <span>FSTBank</span></a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i><span
						class="hidden-sm hidden-xs"> admin</span> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">Profile</a></li>
					<li class="divider"></li>
					<li><a href="./Deconnexion">Logout</a></li>
				</ul>
			</div>
			<!-- user dropdown ends -->

			<!-- theme selector starts -->
			<div class="btn-group pull-right theme-container animated tada">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-tint"></i><span
						class="hidden-sm hidden-xs"> Change Theme / Skin</span> <span
						class="caret"></span>
				</button>
				<ul class="dropdown-menu" id="themes">
					<li><a data-value="classic" href="#"><i class="whitespace"></i>
							Classic</a></li>
					<li><a data-value="cerulean" href="#"><i
							class="whitespace"></i> Cerulean</a></li>
					<li><a data-value="cyborg" href="#"><i class="whitespace"></i>
							Cyborg</a></li>
					<li><a data-value="simplex" href="#"><i class="whitespace"></i>
							Simplex</a></li>
					<li><a data-value="darkly" href="#"><i class="whitespace"></i>
							Darkly</a></li>
					<li><a data-value="lumen" href="#"><i class="whitespace"></i>
							Lumen</a></li>
					<li><a data-value="slate" href="#"><i class="whitespace"></i>
							Slate</a></li>
					<li><a data-value="spacelab" href="#"><i
							class="whitespace"></i> Spacelab</a></li>
					<li><a data-value="united" href="#"><i class="whitespace"></i>
							United</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!-- topbar ends -->
    <title>Gestion Compte</title>
<div class="box-content">
	<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a href="#compte">Acceuil client</a></li>
	</ul>
	</br>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane active" id="compte">

			<div class="row">
				<div class="col-md-12">

					<!--table satrts-->
					<table
						class="table table-striped table-bordered bootstrap-datatable datatable responsive">
					<thead>
							<tr>
								<th>N°</th>
								<th>Solde</th>
								<th>Date de creation</th>
								<th>Type de compte</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${comptes}" var="compte">
							<tr>
								<td>${compte.code}</td>
								<td>${compte.solde}</td>
								<td>${compte.dateCreation}</td>
								<td>${compte.type}</td>
								<td class="center">
									<a class="btn btn-success btn-view btn-verser" href="#" data-id="${compte.code}">
										<i class="glyphicon glyphicon-zoom-in icon-white"></i> verser
									</a>
									<a class="btn btn-primary btn-view btn-retirer" href="#" data-id="${compte.code}">
										<i class="glyphicon glyphicon-zoom-in icon-white"></i> retirer
									</a>
									<a class="btn btn-info btn-view btn-imprimer" href="#" data-id="${compte.code}">
										<i class="glyphicon glyphicon-zoom-in icon-white"></i> Imprimer
									</a>
								</td>
								
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!--table ends -->
				</div>
			</div>
			<!--row ends-->
		</div>
		
	<!--modal start -->
	 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		 <div class="modal-dialog">
			<div class="modal-content">
			   <div class="modal-header">
				   <button type="button" class="close" data-dismiss="modal">×</button>
				   <h3>Faire un virement/retrait</h3>
			   </div>
			   <div class="modal-body" id="info">
		
		       </div>
		      
			 </div>
		  </div>
	 </div><!--modal ends-->
<jsp:include page="includes/footer.jsp"></jsp:include>
<script>
		$('.btn-verser').click(function (e) {
			var id = $(this).data('id');
			$.ajax({
				type : 'get',
				url : 'GestionComptes?verser='+id,
				success : function(data) {
					
						$('#info').html(data);
						
				}
			});
		});
		$('.btn-retirer').click(function (e) {
			var id = $(this).data('id');
			$.ajax({
				type : 'get',
				url : 'GestionComptes?retirer='+id,
				success : function(data) {
					
						$('#info').html(data);
						
				}
			});
		});
</script>
	