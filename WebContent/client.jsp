<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<jsp:include page="includes/header.jsp"></jsp:include>
    <title>Gestion client</title>
<div class="box-content">
	<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a href="#medcin">Gestions des client</a></li>
		<li><a href="#AjouteClient"><img src="img/add.png" />Ajouter
				un client</a></li>
				<li><a href="#AjouteClientPro"><img src="img/add.png" />Ajouter
				un Client Professionnel</a></li>
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
			<!--row ends-->
		</div>
		<div class="tab-pane" id="AjouteClient">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div>
						<div class="box-content">
							<form action="./GestionClients" method="POST">
								<div class="form-group">
									<label>Nom</label> <input type="text" tep="0.001" name="nom"
										class="form-control" placeholder="nom">
								</div>
								
								<div class="form-group">
									<label>Prenom</label> <input type="text"
										name="prenom" class="form-control" placeholder="prenom">
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
								<input type="hidden" name="typeClient" value="particulier">
								<input type="submit" value="Envoyer" name="ajouterclient">
								
							</form>
						</div>
					</div>
				</div>
				<!--/span-->

			</div>
			<!--end row-->
		</div>
						<div class="tab-pane" id="AjouteClientPro">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div>
						<div class="box-content">
							<form action="./GestionClients" method="POST">

								<div class="form-group">
									<label>Nom :</label> <input type="text" name="nom"
										class="form-control" placeholder="nom de l'entreprise">
								</div>
								<div class="form-group">
									<label>Local :</label> <input type="text" name="adresseEnt"
										class="form-control" placeholder="adresse de l'entreprise">
								</div>
								<div class="form-group">
									<label>Telephone :</label> <input type="text" name="telephoneEnt"
										class="form-control" placeholder="telephone">
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
								<input type="hidden" name="typeClient" value="Professionnel">
								<input type="submit" value="Envoyer" name="ajouterclient">
								
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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>AFFICHAGE</h3>
                </div>
                <div class="modal-body" id="info">
                   
                </div>
               
            </div>
        </div>
    </div><!--modal ends-->

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
    
<jsp:include page="includes/footer.jsp"></jsp:include>
<script>
		$('.btn-edit').click(function (e) {
			var id = $(this).data('id');
			$.ajax({
				type : 'get',
				url : 'GestionClients?modifier='+id,
				success : function(data) {
					
						$('#infoModif').html(data);
						
				}
			});
		});
	
</script>

