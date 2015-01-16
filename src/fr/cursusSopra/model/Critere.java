package fr.cursusSopra.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.PostgresConnection;

public class Critere {
	private int idCritere;
	private String critere;
	private int idBar;

	public Critere(){}

	public int getIdCritere() {
		return idCritere;
	}

	public String getCritere() {
		return critere;
	}
	
	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

	/**
	 * R�cup�re la liste de tous les crit�res sp�ciaux de bars dans la base de donn�es et cr�e les objets Critere correspondant
	 * @return List<Bar>
	 */
	public static List<Critere> getListeCriteres(){
		List<Critere> lstCritereBar = new ArrayList<Critere>();		
		Connection cnx = PostgresConnection.GetConnexion();
		
		//requete de selection de tous les bars
		String query = "SELECT idcritere, critere FROM criteresspeciaux";
		
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			//remplissage tant qu'on trouve des crit�res sp�ciaux
			while (rs.next())
			{
				Critere newCritere = new Critere();
				newCritere.idCritere = rs.getInt("idcritere");
				newCritere.critere = rs.getString("critere");		
				lstCritereBar.add(newCritere);
			}		
			rs.close();		
		}catch (SQLException e){
			e.printStackTrace();
		}
		
		return lstCritereBar;
	}
	
	public static List<Critere> listeCritere(int idBar){
		List<Critere> lstCritere = new ArrayList<Critere>();
		
		Connection cnx = PostgresConnection.GetConnexion();
		
		//requete de selection de tous les bars
		String query = "SELECT * FROM v_listcriterebar WHERE idbar =?";
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();
			
			//remplissage tant qu'on trouve des criteres
			while (rs.next())
			{
				Critere critere = new Critere();
				critere.critere = rs.getString("critere");	
				critere.idCritere = rs.getInt("idcritere");
				lstCritere.add(critere);
			}		
			rs.close();		
		}catch (SQLException e){
			e.printStackTrace();
		}
		
		return lstCritere;
	}
}