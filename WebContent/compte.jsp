<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<jsp:include page="includes/header.jsp"></jsp:include>

<div class="box-content">
	<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a href="#medcin">Gestions des infirmiers</a></li>
		<li><a href="#Ajouterinfirmier"><img src="img/add.png" />Ajouter
				un infirmier</a></li>
	</ul>
	</br>

	<div id="myTabContent" class="tab-content">
		<div class="tab-pane active" id="medcin">

			<div class="row">
				<div class="col-md-12">

					<!--table satrts-->
					<table
						class="table table-striped table-bordered bootstrap-datatable datatable responsive">
						<thead>
							<tr>
								<th>Username</th>
								<th>Date registered</th>
								<th>Role</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>David R</td>
								<td class="center">2012/01/01</td>
								<td class="center">Member</td>
								<td class="center"><span
									class="label-success label label-default">Active</span></td>
								<td class="center"><a class="btn btn-success" href="#">
										<i class="glyphicon glyphicon-zoom-in icon-white"></i> View
								</a> <a class="btn btn-info" href="#"> <i
										class="glyphicon glyphicon-edit icon-white"></i> Edit
								</a> <a class="btn btn-danger" href="#"> <i
										class="glyphicon glyphicon-trash icon-white"></i> Delete
								</a></td>
							</tr>
							<tr>
						</tbody>
					</table>
					<!--table ends -->
				</div>
			</div>
			<!--row ends-->
		</div>
		<div class="tab-pane" id="Ajouterinfirmier">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div>

						<div class="box-content">
							<form action="./GestionComptes" method="POST">
								<div class="form-group">
									<label>solde du compte</label> <input type="text" name="solde"
										class="form-control" placeholder="solde du compte">
								</div>
								<div class="form-group">
									<label>sexe </label>
									<div class="controls">
										<select name="sexe">
											<option>homme</option>
											<option>femme</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="exampleInputlogin">Login</label> <input type="text"
										name="login" class="form-control" placeholder="login">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										placeholder="password">
								</div>
								<input type="submit" value="Envoyer" name="ajoutercompte">
							</form>
						</div>
					</div>
				</div>
				<!--/span-->

			</div>
			<!--end row-->
		</div>
	</div>
</div>

<jsp:include page="includes/footer.jsp"></jsp:include>

