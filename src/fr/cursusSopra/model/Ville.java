package fr.cursusSopra.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.PostgresConnection;

public class Ville {
	private String cp;
	private String nom;
	
	public Ville(String cp, String nom){
		setNom(nom);
		setCp(cp);
	}
	
	public void SaveVille(){
		Connection cnx = PostgresConnection.GetConnexion();
		Statement state;
		String queryVille = "INSERT INTO villes (cp, ville) VALUES (?,?) ";
		try {
			PreparedStatement ps = cnx.prepareStatement(queryVille);
			ps.setString(1, cp);
			ps.setString(2, nom);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	public static List<String> getLstChampVille() {
		List<String> lstChampVille = new ArrayList<String>();
		Connection cnx = PostgresConnection.GetConnexion();

		String queryVille = "SELECT ville FROM villes";
		
		Statement state;
		try {
			state = cnx.createStatement();
			ResultSet rsLstChampVille = state.executeQuery(queryVille);
			while(rsLstChampVille.next()){
				lstChampVille.add(rsLstChampVille.getString("ville"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return lstChampVille;
	}
	
	public static List<Ville> getListeVilles(){
		List<Ville> lstVille = new ArrayList<Ville>();		
		Connection cnx = PostgresConnection.GetConnexion();
		
		//requete de selection de toutes les villes
		String query = "SELECT ville, cp FROM villes";
		
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			//remplissage tant qu'on trouve des ville
			while (rs.next())
			{
				Ville newVille = new Ville(rs.getString("cp"), rs.getString("ville"));
				lstVille.add(newVille);
			}		
			rs.close();		
		}catch (SQLException e){
			e.printStackTrace();
		}
		
		return lstVille;
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getCp() {
		return cp;
	}
	
	public static String getCpWithVille (String nom) {
		Connection cnx = PostgresConnection.GetConnexion();
		String queryCp = "SELECT cp FROM villes WHERE ville=?";
		try {
			// Récupération du code postal de la ville sélectionnée
			PreparedStatement psCp = cnx.prepareStatement(queryCp);
			psCp.setString(1, nom);
			ResultSet rsCp = psCp.executeQuery();
			rsCp.next();	
			return rsCp.getString("cp");
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void setCp(String cp) {
		this.cp = cp;
	}

}
