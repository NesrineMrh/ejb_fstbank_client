<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<jsp:include page="includes/header.jsp"></jsp:include>
    <title>Gestion Compte</title>
<div class="box-content">
	<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a href="#compte">Gestions des Comptes</a></li>
		<li><a href="#AjouteCompte"><img src="img/add.png" />Ajouter un Compte</a></li>
				<li><a href="#AjouteComptePro"><img src="img/add.png" />Ajouter un Compte Professionnel</a></li>
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
									<a class="btn btn-primary btn-edit btn-modif" href="#" data-id="${compte.code}">
									 <i class="glyphicon glyphicon-edit icon-white "></i> Modifier
									</a>	 
									<!-- JS du boutton supprimer est dans includes/footer.jsp -->
									<a class="btn btn-danger btn-delete" href="#" data-id="${compte.code}">
									 <i class="glyphicon glyphicon-trash icon-white"></i> Supprimer
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
		<div class="tab-pane" id="AjouteCompte">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div>
						<div class="box-content">
							<form action="./GestionComptes" method="POST">

								<div class="form-group">
									<label>Type de compte </label>
									<div class="controls">
										<select name="type">
											<option value="prive" >Prive</option>
											<option value="partage" selected>Partage</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label>solde du compte</label> <input type="number" tep="0.001" name="solde"
										class="form-control" placeholder="solde du compte">
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
								<input type="hidden" name="typeCompte" value="particulier">
								<input type="submit" value="Envoyer" name="ajoutercompte">
								
							</form>
						</div>
					</div>
				</div>
				<!--/span-->

			</div>
			<!--end row-->
		</div>
				<div class="tab-pane" id="AjouteComptePro">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div>
						<div class="box-content">
							<form action="./GestionComptes" method="POST">

								<div class="form-group">
									<label>Nom :</label> <input type="text" name="nomEnt"
										class="form-control" placeholder="nom de l'entreprise">
								</div>
								<div class="form-group">
									<label>Local :</label> <input type="text" name="adresse"
										class="form-control" placeholder="adresse de l'entreprise">
								</div>
								<div class="form-group">
									<label>Telephone :</label> <input type="text" name="telephone"
										class="form-control" placeholder="telephone">
								</div>	
								<div class="form-group">
									<label>solde du compte</label> <input type="number" tep="0.001" name="solde"
										class="form-control" placeholder="solde du compte">
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
								<input type="hidden" name="typeCompte" value="Professionnel">
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


<!--modal start -->
    <div class="modal fade" id="myModalModif" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>MODIFICATION</h3>
                </div>
                <div class="modal-body" id="infoModif">
                   
                </div>
               
            </div>
        </div>
    </div><!--modal ends-->
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
		$('.btn-modif').click(function (e) {
			var id = $(this).data('id');
			$.ajax({
				type : 'get',
				url : 'GestionComptes?modifier='+id,
				success : function(data) {
					
						$('#infoModif').html(data);
						
				}
			});
		});
</script>

