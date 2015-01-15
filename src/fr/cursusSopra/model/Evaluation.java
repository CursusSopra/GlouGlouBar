//Propriete de Florian et Adeline

package fr.cursusSopra.model;

import java.sql.*;

import fr.cursusSopra.tech.PostgresConnection;

public class Evaluation {

	//private int ideval;  //Propriété de la table Evaluation mais jamais utilisé dans cette classe, donc commenter
	private int idcritique;
	private int idcriteval;
	private int note;

	// Constructeur vide
	public Evaluation() {}
	
	//Constructeur 
	public Evaluation(int idcritiqueExt, int idcritevalExt, int noteExt) {
		idcriteval = idcritevalExt;
		idcritique = idcritiqueExt;
		note = noteExt;
	}

	//Ajoute l'evaluation dans la BDD
	public int AddEval() {
		Connection cnx = PostgresConnection.GetConnexion();
		String queryAddEval = "INSERT INTO evaluations (idcritique,idcriteval,note ) VALUES (?,?, ?)";
		PreparedStatement psAddEval;
		try {
			psAddEval = cnx.prepareStatement(queryAddEval);
			psAddEval.setInt(1, idcritique);
			psAddEval.setInt(2, idcriteval);
			psAddEval.setInt(3, note);

			int result = psAddEval.executeUpdate();

			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}


}
