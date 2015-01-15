package fr.cursusSopra.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.PostgresConnection;

public class Jour {
	private int idJour;
	private String jour;
	
	public static List<Jour> getLstJours(){
		List<Jour> lstJours = new ArrayList<Jour>();
		Connection cnx = PostgresConnection.GetConnexion();
		try {

			String queryJour = "SELECT idjour, jour FROM jours";
			PreparedStatement ps = cnx.prepareStatement(queryJour);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Jour jour = new Jour();
				jour.setIdJour(rs.getInt("idjour"));
				jour.setJour(rs.getString("jour"));
				lstJours.add(jour);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lstJours;
	}
	
	public int getIdJour() {
		return idJour;
	}
	public void setIdJour(int idJour) {
		this.idJour = idJour;
	}
	public String getJour() {
		return jour;
	}
	public void setJour(String jour) {
		this.jour = jour;
	}

}
