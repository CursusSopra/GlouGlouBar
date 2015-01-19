package fr.cursusSopra.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.CategorieBar;
import fr.cursusSopra.model.Critere;
import fr.cursusSopra.model.CriteresEval;
import fr.cursusSopra.model.Jour;
import fr.cursusSopra.model.Ville;
import fr.cursusSopra.tech.Adresse;

public class FormModifyBarAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4535160798778265077L;
	
	private int idBar;
	private Bar leBar;
	private List<CategorieBar> lstCategories;
	private List<Critere> lstCriteres;
	private List<String> champVille;
	private List<Jour> lstJours;
		
	public String execute() {
		setLeBar(new Bar(idBar));
		return SUCCESS;
	}

	public String accessFormModify(){
		setLeBar(new Bar(idBar));
		setChampVille(Ville.getLstChampVille());
		lstCategories = CategorieBar.getListeCategoriesBar();
		lstCriteres = Critere.getListeCriteres();
		lstJours = Jour.getLstJours();
		return SUCCESS;
	}
	
	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

	public Bar getLeBar() {
		return leBar;
	}

	public void setLeBar(Bar leBar) {
		this.leBar = leBar;
	}
	public void setChampVille(List<String> champVille) {
		this.champVille = champVille;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<CategorieBar> getLstCategories() {
		return lstCategories;
	}

	public List<Critere> getLstCriteres() {
		return lstCriteres;
	}

	public List<String> getChampVille() {
		return champVille;
	}

	public List<Jour> getLstJours() {
		return lstJours;
	}
	

}
