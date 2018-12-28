<form action="./GestionComptes" method="POST">

	<div class="form-group">

		<label>Type de compte </label>
		<div class="controls">
			<select name="type">
				<option value="prive" ${compte.type== 'prive' ? 'selected':'' }>Prive</option>
				<option value="partage" ${compte.type== 'partage' ? 'selected':'' }>Partage</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label>solde du compte</label> <input type="number" step="0.001" name="solde"
			class="form-control" placeholder="solde du compte"
			value="${compte.solde}"></input>
	</div>
	<input type="hidden" name="code" value="${compte.code }"></input> <input
		type="hidden" name="date" value="${compte.dateCreation }"></input> <input
		type="submit" value="Envoyer" name="modifiercompte">

</form>