//Création Bar Action
//Nicolas

package fr.cursusSopra.action;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.Horaire;
import fr.cursusSopra.model.Jour;
import fr.cursusSopra.model.Ville;
import fr.cursusSopra.model.CategorieBar;
import fr.cursusSopra.model.Critere;
import fr.cursusSopra.tech.Adresse;

public class CreationBarAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6003588437744997532L;

	private String nom;
	private String numTel;
	private String site;
	private String description;
	private String voie;
	private String ville;
	private double latitude;
	private double longitude;
	private List<CategorieBar> lstCategories;
	private List<Critere> lstCriteres;
	private List<String> champVille;
	private List<Jour> lstJours;
	private String idJour;
	private String idHeureDebut;
	private String idHeureFin;

	private int[] checkboxCritere;
	private int[] checkboxCategorie;

	public String execute() throws ParseException {
		Bar leBar = new Bar();
		
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
		//Sauvegarde du bar
		int result = leBar.SaveBar();

		// Récupération de la liste des critères
		List<Critere> lstCritere = new ArrayList<>();
		for (int i = 0; i < checkboxCritere.length; i++) {
			Critere crit = new Critere();
			crit.setIdBar(leBar.getIdBar());
			crit.setIdCritere(checkboxCritere[i]);
			lstCritere.add(crit);
			//Sauvegarde du critère
			crit.SaveCritere();
		}
		leBar.setLstCritere(lstCritere);

		// Récupération de la liste des catégories
		List<CategorieBar> lstCategorieBar = new ArrayList<>();
		for (int j = 0; j < checkboxCategorie.length; j++) {
			CategorieBar catBar = new CategorieBar();
			catBar.setIdBar(leBar.getIdBar());
			catBar.setIdCategorie(checkboxCategorie[j]);
			lstCategorieBar.add(catBar);
			//Sauvegarde de la catégorie
			catBar.SaveCategorie();
		}
		leBar.setLstCategorie(lstCategorieBar);

		// Récupération de la liste des horaires
		String[] tabJoursOuvert = idJour.split(",");
		String[] tabHeureDebutOuvert = idHeureDebut.split(",");
		String[] tabHeureFinOuvert = idHeureFin.split(",");
		
		DateFormat formatter = new SimpleDateFormat("hh:mm");
		List<Horaire> lstHoraires = new ArrayList<>();
		for (int k = 0; k < tabJoursOuvert.length; k++) {
			Horaire horaire = new Horaire();
			horaire.setIdBar(leBar.getIdBar());
			horaire.setIdJour(Integer.parseInt(tabJoursOuvert[k]));
			horaire.setHeureDebut(tabHeureDebutOuvert[k]);
			horaire.setHeureFin(tabHeureFinOuvert[k]);
			lstHoraires.add(horaire);
			//Sauvegarde de l'horaire
			horaire.SaveHoraire();
		}
		leBar.setLstHoraires(lstHoraires);

		return result == 0 ? ERROR : SUCCESS;
	}

	public String accessFormCreation() {
		setChampVille(Ville.getLstChampVille());
		lstCategories = CategorieBar.getListeCategoriesBar();
		lstCriteres = Critere.getListeCriteres();
		lstJours = Jour.getLstJours();
		return SUCCESS;
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

	public void setVoie(String voie) {
		this.voie = voie;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public List<String> getChampVille() {
		return champVille;
	}

	public void setChampVille(List<String> champVille) {
		this.champVille = champVille;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public List<CategorieBar> getLstCategories() {
		return lstCategories;
	}

	public List<Critere> getLstCriteres() {
		return lstCriteres;
	}

	public void setCheckboxCritere(int[] checkboxCritere) {
		this.checkboxCritere = checkboxCritere;
	}

	public void setCheckboxCategorie(int[] checkboxCategorie) {
		this.checkboxCategorie = checkboxCategorie;
	}

	public void setIdJour(String idJour) {
		this.idJour = idJour;
	}

	public void setIdHeureDebut(String idHeureDebut) {
		this.idHeureDebut = idHeureDebut;
	}

	public void setIdHeureFin(String idHeureFin) {
		this.idHeureFin = idHeureFin;
	}

	public List<Jour> getLstJours() {
		return lstJours;
	}
}
