package fr.cursusSopra.tech;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.Critere;
import fr.cursusSopra.model.Ville;

public class Adresse {
	private Ville ville;
	private String voie;

	/**
	 * Ajoute une adresse à un bar. Appelée dans la méthode Create()
	 * 
	 * @return
	 */
	public static int CreateAdresse(Bar leBar) {
		Connection cnx = PostgresConnection.GetConnexion();
		String queryAdresse = "INSERT INTO adresses (voie, cp) VALUES (?, ?) RETURNING idadresse";
		try {
			// Insertion de l'adresse dans la base de données
			PreparedStatement psAdresse = cnx.prepareStatement(queryAdresse);
			String voie = leBar.getAdresse().getVoie();
			psAdresse.setString(1, voie);
			String cp = leBar.getAdresse().getVille().getCp();
			psAdresse.setString(2, cp);
			// Récupération de l'idadresse
			ResultSet rsAdresse = psAdresse.executeQuery();
			rsAdresse.next();
			return rsAdresse.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public String getVoie() {
		return voie;
	}

	public void setVoie(String voie) {
		this.voie = voie;
	}

	public Ville getVille() {
		return ville;
	}

	public void setVille(Ville ville) {
		this.ville = ville;
	}

	public static Adresse getAdresse(int idBar) {
		// TODO Auto-generated method stub
		Adresse adresse = new Adresse();
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT * FROM v_adressebar WHERE idbar =?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des criteres
			if (rs.next()) {
				Ville ville = new Ville();
				ville.setNom(rs.getString("ville"));
				ville.setCp(rs.getString("cp"));
				
				adresse.setVille(ville);
				adresse.setVoie(rs.getString("voie"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return adresse;
	}
}
