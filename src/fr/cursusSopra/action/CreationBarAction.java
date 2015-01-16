//Création Bar Action
//Nicolas

package fr.cursusSopra.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.Jour;
import fr.cursusSopra.model.Ville;
import fr.cursusSopra.model.CategorieBar;
import fr.cursusSopra.model.Critere;
import fr.cursusSopra.tech.Adresse;
import fr.cursusSopra.tech.BarCategorie;
import fr.cursusSopra.tech.BarCritere;

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
	private List<CategorieBar> lstCategories;
	private List<Critere> lstCriteres;
	private List<String> champVille;
	private List<Jour> lstJours;
	private String idJour;
	private String idHeureDebut;
	private String idHeureFin;

	private int[] checkboxCritere;
	private int[] checkboxCategorie;

	public String execute() {
		Bar leBar = new Bar();
		//Infos de base
		leBar.setNom(nom);
		leBar.setNumTel(numTel);
		leBar.setSite(site);
		leBar.setDescription(description);
		
		//Récupération de l'adresse
		Adresse adresse = new Adresse();
		Ville villeBar = new Ville();
		villeBar.setVille(ville);
		villeBar.setCp(Ville.getCpWithVille(ville));
		
		adresse.setVoie(voie);
		adresse.setVille(villeBar);
		
		leBar.setAdresse(adresse);
		
		//Récupération de la liste des critères
		List<BarCritere> lstBarCritere = new ArrayList<>();
		for (int i = 0; i < checkboxCritere.length; i++) {
			BarCritere barCrit = new BarCritere();
			barCrit.setIdcritere(checkboxCritere[i]);
			lstBarCritere.add(barCrit);
		}
		leBar.setLstBarCritere(lstBarCritere);
		
		//Récupération de la liste des catégories
		List<BarCategorie> lstBarCategorie = new ArrayList<>();
		for (int i = 0; i < checkboxCritere.length; i++) {
			BarCategorie barCat = new BarCategorie();
			barCat.setIdCategorie(checkboxCategorie[i]);
			lstBarCategorie.add(barCat);
		}
		leBar.setLstBarCategorie(lstBarCategorie);

		String[] tabJoursOuvert = idJour.split(",");
		String[] tabHeureDebutOuvert = idHeureDebut.split(",");
		String[] tabHeureFinOuvert = idHeureFin.split(",");

		leBar.setTabJoursOuvert(tabJoursOuvert);
		leBar.setTabHeureDebutOuvert(tabHeureDebutOuvert);
		leBar.setTabHeureFinOuvert(tabHeureFinOuvert);

		int result = leBar.Create();

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
