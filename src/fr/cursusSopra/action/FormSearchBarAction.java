package fr.cursusSopra.action;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Search;

public class FormSearchBarAction extends ActionSupport {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Search searchElt;
	
	public String execute() {
		setSearchElt(new Search());
		
		return SUCCESS;
	}

	public Search getSearchElt() {
		return searchElt;
	}

	public void setSearchElt(Search searchElt) {
		this.searchElt = searchElt;
	}

		
}
