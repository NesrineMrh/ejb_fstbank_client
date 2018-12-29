<form action="./GestionClients" method="POST">

	<div class="form-group">
		<label>nom</label> <input type="text" step="0.001" name="nom"
			class="form-control" placeholder="nom"
			value="${client.nom}"></input>	
	</div>
	<div class="form-group">
		<label>prenom</label> <input type="text" step="0.001" name="prenom"
			class="form-control" placeholder="prenom"
			value="${client.prenom}"></input>	
	</div>
	<input type="hidden" name="id" value="${client.id }"></input>
    <input type="submit" value="Envoyer" name="modifierclient">

</form>