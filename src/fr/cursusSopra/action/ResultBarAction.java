package fr.cursusSopra.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Search;
import fr.cursusSopra.model.Bar;

public class ResultBarAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Search searchElt;
	private String[] cpSelected;
	private int[] catSelected;
	private int[] selectedCritere;

	public void setSelectedCritere(int[] selectedCritere) {
		this.selectedCritere = selectedCritere;
	}

	public int[] getCatSelected() {
		return catSelected;
	}

	public void setCatSelected(int[] catSelected) {
		this.catSelected = catSelected;
	}

	private List<Bar> lstBars;
	private String adresse;

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	private String nom;

	public Search getSearchElt() {
		return searchElt;
	}

	public void setSearchElt(Search searchElt) {
		this.searchElt = searchElt;
	}

	public String execute() {


		if (adresse.isEmpty() && nom.isEmpty() && cpSelected != null && catSelected == null && selectedCritere==null ) {
			ExecuteSearchByCP();
		}
		if (!adresse.isEmpty() && nom.isEmpty() && cpSelected == null && catSelected == null && selectedCritere==null) {
			ExecuteSearchByAdresse();
		}
		if (adresse.isEmpty() && !nom.isEmpty() && cpSelected == null && catSelected == null && selectedCritere==null) {
			ExecuteSearchByName();
		}
		
		if (adresse.isEmpty() && nom.isEmpty() && cpSelected == null && catSelected != null && selectedCritere==null) {
			ExecuteSearchByCat();
		}
		if (adresse.isEmpty() && nom.isEmpty() && cpSelected == null && catSelected == null && selectedCritere!=null ) {
			ExecuteSearchByCrit();
		}
		else{
			ExecuteMultiSearch();
		}
	
		return SUCCESS;

	}
	
	private void ExecuteMultiSearch() {
		setLstBars(new ArrayList<Bar>());
		searchElt = new Search();
		searchElt.MultiSearch(nom, adresse,catSelected , cpSelected, selectedCritere);
		setLstBars(searchElt.getLstbar());
	}

	private void ExecuteSearchByCP() {
		setLstBars(new ArrayList<Bar>());
		searchElt = new Search();
		searchElt.SearchIdBarByCp(cpSelected);
		setLstBars(searchElt.getLstbar());
	}
	
	private void ExecuteSearchByName() {
		setLstBars(new ArrayList<Bar>());
		searchElt = new Search();
		searchElt.SearchByName(nom);
		setLstBars(searchElt.getLstbar());
	}


	private void ExecuteSearchByCat() {
		setLstBars(new ArrayList<Bar>());
		searchElt = new Search();
		searchElt.SearchIdBarByCat(catSelected);
		setLstBars(searchElt.getLstbar());
	}
	
	private void ExecuteSearchByCrit() {
		setLstBars(new ArrayList<Bar>());
		searchElt = new Search();
		searchElt.SearchIdBarByCrit(selectedCritere);
		setLstBars(searchElt.getLstbar());
	}

	private void ExecuteSearchByAdresse() {
		setLstBars(new ArrayList<Bar>());
		searchElt = new Search();
		searchElt.SearchByAdresse(adresse);
		setLstBars(searchElt.getLstbar());
	}

	public String[] getCpSelected() {
		return cpSelected;
	}

	public void setCpSelected(String[] cpSelected) {
		this.cpSelected = cpSelected;
	}

	public List<Bar> getLstBars() {
		return lstBars;
	}

	public void setLstBars(List<Bar> lstBars) {
		this.lstBars = lstBars;
	}

}
