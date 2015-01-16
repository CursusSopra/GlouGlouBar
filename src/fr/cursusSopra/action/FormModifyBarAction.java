package fr.cursusSopra.action;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.CriteresEval;

public class FormModifyBarAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4535160798778265077L;
	
	int idBar;
	Bar leBar;

	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

	public String execute() {
		leBar = new Bar(idBar);
		return SUCCESS;
	}
	
	public String accessFormCreation(){
		leBar = new Bar(idBar);
		return SUCCESS;
	}

}
