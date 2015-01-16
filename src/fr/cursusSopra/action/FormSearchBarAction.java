package fr.cursusSopra.action;


import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.CategorieBar;
import fr.cursusSopra.model.Critere;
import fr.cursusSopra.model.Search;
import fr.cursusSopra.model.Ville;

public class FormSearchBarAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private List<Critere> lstCriteres;
	private List<CategorieBar> lstCategories;
	private List<Ville> lstVilles;

	public String execute() {
		setLstCriteres(Critere.getListeCriteres());
		setLstCategories(CategorieBar.getListeCategoriesBar());
		setLstVilles(Ville.getListeVilles() );
		return SUCCESS;
	}

	public List<Critere> getLstCriteres() {
		return lstCriteres;
	}

	public void setLstCriteres(List<Critere> lstCriteres) {
		this.lstCriteres = lstCriteres;
	}

	public List<CategorieBar> getLstCategories() {
		return lstCategories;
	}

	public void setLstCategories(List<CategorieBar> lstCategories) {
		this.lstCategories = lstCategories;
	}

	public List<Ville> getLstVilles() {
		return lstVilles;
	}

	public void setLstVilles(List<Ville> lstVilles) {
		this.lstVilles = lstVilles;
	}

		
}
