package fr.cursusSopra.action;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.CriteresEval;

public class FormModifyBarAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4535160798778265077L;
	
	private int idBar;
	private Bar leBar;
	
	public String execute() {
		setLeBar(new Bar(idBar));
		return SUCCESS;
	}
	
	public String accessFormCreation(){
		setLeBar(new Bar(idBar));
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

}
