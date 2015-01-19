package fr.cursusSopra.action;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Bar;


public class DirectionsAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int idBar;
	private Bar leBar;
	
	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}
	public int getIdBar() {
		return idBar;
	}
	
	public Bar getLeBar(){
		return leBar;
	}
	public String execute(){
		leBar = new Bar(idBar);
		return SUCCESS;
	}
}
