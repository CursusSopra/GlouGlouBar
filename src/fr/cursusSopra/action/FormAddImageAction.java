//Florian

package fr.cursusSopra.action;

import com.opensymphony.xwork2.ActionSupport;


public class FormAddImageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int idBar;
	
	public String execute() {
		return SUCCESS;
	}

	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}


}
