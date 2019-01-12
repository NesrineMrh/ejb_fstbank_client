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

									<option value="">choix d'un client</option>
									<optgroup label="Client particulier">
										<c:forEach items="${allclients}" var="c">
											<option value=${c.id }>${c.nom}${ c.prenom }</option>
										</c:forEach>
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
									<c:forEach items="${allcomptes}" var="c">
										<option value="${c.code}">${ c.code }: ${ c.solde }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<br>
						  <button type="submit" class="btn btn-default" name="associer">Envoyer</button>
					</form>
				</div>
			</div>
		</div>

	</div>
</div>
<!--/row-->
<jsp:include page="includes/footer.jsp"></jsp:include>
