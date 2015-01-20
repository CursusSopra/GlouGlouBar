package fr.cursusSopra.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.CategorieBar;
import fr.cursusSopra.model.Critere;
import fr.cursusSopra.model.Ville;

public class IndexAction extends ActionSupport {

	private List<Bar> lstBars;	
	private List<Ville> lstVilles;
	private List<Critere> lstCriteres;
	private List<CategorieBar> lstCategories;
	/**
	 * 
	 */
	private static final long serialVersionUID = -336197339380396177L;
	
	public String execute(){
		lstBars= Bar.getListeDesBars();
		setLstCriteres(Critere.getListeCriteres());
		setLstCategories(CategorieBar.getListeCategoriesBar());
		setLstVilles(Ville.getListeVilles() );
		return SUCCESS;
	}
	public List<Bar> getLstBars() {
		return lstBars;
	}
	public List<Ville> getLstVilles() {
		return lstVilles;
	}
	public void setLstVilles(List<Ville> lstVilles) {
		this.lstVilles = lstVilles;
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
}
