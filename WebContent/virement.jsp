<form class="md-float-material">
			<div class="form-group">
				<label for="nom">votre solde :</label> 
				<input type="number" name="solde" id="solde" class="form-control" value="${compte.solde}">
				<input type="hidden" name="code" id="code" class="form-control" value="${compte.code}">
			</div>
			<div class="form-group">
				<label for="code">Code :</label> 
				<input type="number" name="code2" id="code2" class="form-control" placeholder="code du compte déstiné">
			</div>
			<div class="form-group">
				<label for="montant">montant : </label>
			    <input type="number" name="montant" id="montant" class="form-control" placeholder="entrer le montant a versé">
			</div>
			<button type="submit" class="btn btn-primary btn-view btn-verser" id="ok" name="verser" value="verser">verser</button>
</form>
<script type="text/javascript">

 $('.btn-verser').click(function(){
		
		var solde = $('#solde').val();
		var code = $('#code').val();
		var codeDestine = $('#code2').val();
		var montant = $('#montant').val();
		var verser = $('#ok').val();
		console.log("----------solde"+solde+"-------code"+code+"--------codeDd"+codeDestine+"-----verse"+verser);
		$.ajax({
			type:'POST',
			data: {
				solde : solde,
				code : code,
				codeDestine : codeDestine,
				montant : montant,
				verser : verser
			},
			url : './GestionComptes',
			success: function(resultat){
				console.log(resultat);
				if (resultat == "CompteNonTrouvee") {  
					swal("Le compte destinaire n existe pas vérifier son code !!", {
			    	      icon: "error",
			    	    }).then((val) => {
			    	   
			    	      
			    	      });
				}
				else if(resultat == "soldeInsuffisant") {  
					swal("votre solde est insuffisant pour faire ce virement !", {
			    	      icon: "error",
			    	    }).then((val) => {
			    	      
			    	      });
				}else{
					document.location.href=resultat
					
					}
			}
		});
		return false;
	});
 </script>
								