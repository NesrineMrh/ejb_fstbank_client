<form action="./GestionComptes" method="POST">
			<div class="form-group">
				<label for="nom">votre solde :</label> 
				<input type="number" name="solde" class="form-control" value="${compte.solde}">
				<input type="hidden" name="code" class="form-control" value="${compte.code}">
			</div>
			<div class="form-group">
				<label for="montant">montant : </label>
			    <input type="number" name="montant" class="form-control" placeholder="entrer le montant a retiré">
			</div>
			<button type="submit" class="btn btn-primary waves-effect waves-light" name="virement" value="virement">virement</button>
</form>

								