package fr.cursusSopra.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.PostgresConnection;

public class Search {
	private int idBar;
	private String nom;
	
	private String type;
	
	private String evaluation;
	private List<String >lstCP;
	private List<Bar> lstbar;
	
	public List<Bar> getLstbar() {
		return lstbar;
	}

	public void setLstbar(List<Bar> lstbar) {
		this.lstbar = lstbar;
	}

	public List<String> getLstCP() {
		return lstCP;
	}

	public void setLstCP(List<String> lstCP) {
		this.lstCP = lstCP;
	}

	public void SearchIdBarByCp(String[] tabcp) {
		Connection cnx = PostgresConnection.GetConnexion();
		lstbar= new ArrayList<Bar>();
		//requete de selection de tous les bars
		//String query = "SELECT idbar FROM bars WHERE idadresse=(SELECT idadresse FROM adresses WHERE cp IN (?))";
		
		String query = "SELECT idbar FROM bars WHERE idadresse=(SELECT idadresse FROM adresses WHERE cp IN (";
		for(int i=0;i<tabcp.length;i++){
			query+="'"+ tabcp[i]+ "'";
			if(i<tabcp.length-1){
				query+=",";
			}
		}
		query+="))";
		
		
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			//ps.setArray(1, cnx.createArrayOf("String",tabcp));
			ResultSet rs= ps.executeQuery();
			//remplissage tant qu'on trouve des catégories
			while (rs.next())
			{
				Bar LeBar = new Bar(rs.getInt("idbar"));
				lstbar.add(LeBar);
			}		
			rs.close();		
		}catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public Search(){
		lstCP = new ArrayList<String>();

		Connection cnx = PostgresConnection.GetConnexion();
		//requete pour selectionner tous les codes postaux
		String query = "SELECT cp FROM villes";
		
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			//remplissage tant qu'on trouve des catégories
			while (rs.next())
			{		
				lstCP.add( rs.getString("cp") );
			}		
			rs.close();	
		}catch (SQLException e){
			e.printStackTrace();

		}
	}
	
	public int getIdBar() {
		return idBar;
	}
	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	
}