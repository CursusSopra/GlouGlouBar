package fr.cursusSopra.action;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.CategorieBar;
import fr.cursusSopra.model.Critere;
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
	private int[] checkboxCritere;
	private int[] checkboxCategorie;

	public String execute() throws ParseException {

		Bar leBar = new Bar(idBar);

		// Récupération de l'adresse
		Ville villeBar = new Ville(Ville.getCpWithVille(ville), ville);
		Adresse adresse = new Adresse(villeBar, voie, latitude, longitude);

		// Sauvegarde de l'adresse
		adresse.SaveAdresse();

		// RAZ Critères
		leBar.razCritere();

		// RAZ Catégories
		leBar.razCategorie();

		// Récupération de la liste des critères
		List<Critere> lstCritere = new ArrayList<>();
		for (int i = 0; i < checkboxCritere.length; i++) {
			Critere crit = new Critere();
			crit.setIdBar(leBar.getIdBar());
			crit.setIdCritere(checkboxCritere[i]);
			lstCritere.add(crit);
			// Sauvegarde du critère
			crit.SaveCritere();
		}
		

		// Récupération de la liste des catégories
		List<CategorieBar> lstCategorieBar = new ArrayList<>();
		for (int j = 0; j < checkboxCategorie.length; j++) {
			CategorieBar catBar = new CategorieBar();
			catBar.setIdBar(leBar.getIdBar());
			catBar.setIdCategorie(checkboxCategorie[j]);
			lstCategorieBar.add(catBar);
			// Sauvegarde de la catégorie
			catBar.SaveCategorie();
		}
		

		// Infos de base bar
		leBar.setNom(nom);
		leBar.setNumTel(numTel);
		leBar.setSite(site);
		leBar.setDescription(description);
		leBar.setAdresse(adresse);
		leBar.setLstCategorie(lstCategorieBar);
		leBar.setLstCritere(lstCritere);

		// Sauvegarde modification du bar
		int result = leBar.Update();
		result = 1;
		return result == 0 ? ERROR : SUCCESS;
	}

	public void setCheckboxCritere(int[] checkboxCritere) {
		this.checkboxCritere = checkboxCritere;
	}

	public void setCheckboxCategorie(int[] checkboxCategorie) {
		this.checkboxCategorie = checkboxCategorie;
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

	public int[] getCheckboxCritere() {
		return checkboxCritere;
	}

	public int[] getCheckboxCategorie() {
		return checkboxCategorie;
	}
}
