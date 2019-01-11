<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<jsp:include page="includes/header.jsp"></jsp:include>
<title>associer un Compte</title>
<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Form Elements
				</h2>

				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round btn-default"><i
						class="glyphicon glyphicon-cog"></i></a> <a href="#"
						class="btn btn-minimize btn-round btn-default"><i
						class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
						class="btn btn-close btn-round btn-default"><i
						class="glyphicon glyphicon-remove"></i></a>
				</div>
			</div>
			<div class="box-content">
				<div class="control-group">
					<form action="./GestionComptes?associer=jdpwv" method="post">
						<div class="control-group">
							<label class="control-label" for="selectError2">Selectionner
								un client</label>
							<div class="controls">
								<select data-placeholder="choisir un client"
									id="selectError2" data-rel="chosen" name="client">
									<option value=""></option>
									<optgroup label="Particulier">
										<option>New York Giants</option>
										<option>Philadelphia Eagles</option>
										<option>Washington Redskins</option>
									</optgroup>
									<optgroup label="Professionnel">
										<option>Chicago Bears</option>
										<option>Detroit Lions</option>
										<option>Green Bay Packers</option>
										<option>Minnesota Vikings</option>
									</optgroup>
								</select>
							</div>
						</div>
						<br>
						<div class="control-group">
							<label class="control-label" for="selectError1">selectionner
								un ou plusieur comptes</label>

							<div class="controls">
								<select id="selectError1" multiple class="form-control" 
									data-rel="chosen" name="compte">
									<option>Option 1</option>
									<option selected>Option 2</option>
									<option>Option 3</option>
									<option>Option 4</option>
									<option>Option 5</option>
								</select>
							</div>
						</div>
						<input type="submit" name="associer"></input>
					
					</form>
				</div>
			</div>
		</div>
		<!--/span
								<optgroup label="Particulier">
									<c:forEach items="${clients}" var="client">
										<c:if test="${client.type}">
											<option>${client.nom}${client.prenom}</option>
										</c:if>										
									</c:forEach>
								</optgroup>
								<optgroup label="Professionnel">
									<c:forEach items="${clients}" var="client">
										<option>${client.nom}${client.prenom}</option>		
									</c:forEach>						
								</optgroup>-->

				<div class="row">
				<div class="col-md-12">

					<!--table satrts-->
					<table
						class="table table-striped table-bordered bootstrap-datatable datatable responsive">
					<thead>
							<tr>
								<th>N°</th>
								<th>Nom</th>
								<th>Prenom</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${clients}" var="client">
							<tr>
								<td>${client.id}</td>
								<td>${client.nom}</td>
								<td>${client.prenom}</td>
								<td class="center">
								<a class="btn btn-success btn-view" href="#" data-id="${client.id}">
										<i class="glyphicon glyphicon-zoom-in icon-white"></i> Afficher
								</a> <a class="btn btn-info btn-edit" href="#" data-id="${client.id}"> <i
										class="glyphicon glyphicon-edit icon-white "></i> Modifier
								</a> 
								<!-- JS du boutton supprimer est dans includes/footer.jsp -->
								<a class="btn btn-danger btn-delete-client" href="#" data-id="${client.id}"> <i
										class="glyphicon glyphicon-trash icon-white"></i> Supprimer
								</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!--table ends -->
				</div>
			</div>
</div>
	<!--/row-->
	<jsp:include page="includes/footer.jsp"></jsp:include>
