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
	private List<Bar> lstBars;
	
	public Search getSearchElt() {
		return searchElt;
	}

	public void setSearchElt(Search searchElt) {
		this.searchElt = searchElt;
	}

	public String execute() {
		setLstBars(new ArrayList<Bar>());
		searchElt= new Search();
		searchElt.SearchIdBarByCp(cpSelected);
		setLstBars(searchElt.getLstbar());
		return SUCCESS;
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
