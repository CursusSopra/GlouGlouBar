//Propriete de Florian et Adeline

package fr.cursusSopra.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import fr.cursusSopra.tech.PostgresConnection;

public class Critique {

	private int idcritique;
	private int idbar;
	private String comm;
	private Date datecomm;

	//Constructeur Vide
	public Critique() {
	}

	//Ajout critique et evaluations correpsondante dans la BDD
	public int AddCritique(List<Integer> listnotes, List<Integer> listcriteres, String commentaire, int idbarfromAction) {
		Connection cnx = PostgresConnection.GetConnexion();
		String queryAddCrit = "INSERT INTO critiques (idbar,comm,datecomm ) VALUES (?,?) RETURNING idcritique";
		PreparedStatement psAddCrit;
		try {
			psAddCrit = cnx.prepareStatement(queryAddCrit);
			psAddCrit.setInt(1, idbarfromAction);
			psAddCrit.setString(2, commentaire);

			// Ajoute une critique et retoure le numéro de la critique
			ResultSet rs = psAddCrit.executeQuery();
			rs.next();

			int result = 0;
			
			//Ajout des evaluation correspondant a cette critique
			for (int i = 0; i < listnotes.size(); i++) {

				Evaluation evalTest = new Evaluation(rs.getInt("idcritique"),listcriteres.get(i), listnotes.get(i) );
				result=evalTest.AddEval();
			}
			rs.close();

			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}

	}

	public int getIdcritique() {
		return idcritique;
	}

	public void setIdcritique(int idcritique) {
		this.idcritique = idcritique;
	}

	public int getIdbar() {
		return idbar;
	}

	public void setIdbar(int idbar) {
		this.idbar = idbar;
	}

	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public Date getDatecomm() {
		return datecomm;
	}

	public void setDatecomm(Date datecomm) {
		this.datecomm = datecomm;
	}

}
