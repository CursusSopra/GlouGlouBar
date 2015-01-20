package fr.cursusSopra.action;

import java.text.ParseException;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.Ville;
import fr.cursusSopra.tech.Adresse;

public class ModifyBarAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6686012081393880524L;
	
	private int idBar;		
	private String ville;
	private String voie;
	private String nom;
	private String numTel;
	private String site;
	private String description;
	private double latitude;
	private double longitude;
	private int idAdresse;
	
	
	
	
	

	public String execute() throws ParseException{
			
		Bar leBar = new Bar(idBar);
		// Récupération de l'adresse

		Ville villeBar = new Ville(Ville.getCpWithVille(ville), ville);

		Adresse adresse = new Adresse(villeBar, voie, latitude, longitude);
		
	    //Sauvegarde de l'adresse
		adresse.SaveAdresse();
		

		// Infos de base
		
		
		leBar.setNom(nom);
		leBar.setNumTel(numTel);
		leBar.setSite(site);
		leBar.setDescription(description);
		leBar.setAdresse(adresse);

		
		
		

		//Sauvegarde modification du bar
		
		int result = leBar.Update();		
		result = 1;
		return result == 0 ? ERROR : SUCCESS;
	}

	public int getIdAdresse() {
		return idAdresse;
	}

	public void setIdAdresse(int idAdresse) {
		this.idAdresse = idAdresse;
	}

	public int getIdBar() {
		return idBar;
	}



	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}




	public void setVille(String ville) {
		this.ville = ville;
	}



	public void setVoie(String voie) {
		this.voie = voie;
	}



	public void setNom(String nom) {
		this.nom = nom;
	}



	public void setNumTel(String numTel) {
		this.numTel = numTel;
	}



	public void setSite(String site) {
		this.site = site;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}



	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public String getVille() {
		return ville;
	}



	public String getVoie() {
		return voie;
	}



	public String getNom() {
		return nom;
	}



	public String getNumTel() {
		return numTel;
	}



	public String getSite() {
		return site;
	}



	public String getDescription() {
		return description;
	}



	public double getLatitude() {
		return latitude;
	}



	public double getLongitude() {
		return longitude;
	}
	

}
