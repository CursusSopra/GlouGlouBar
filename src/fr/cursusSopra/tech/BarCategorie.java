package fr.cursusSopra.tech;

import com.opensymphony.xwork2.ActionSupport;

public class BarCategorie extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7218886054204237721L;
	
	private int idCategorie;

	public int getIdCategorie() {
		return idCategorie;
	}

	public void setIdCategorie(int idcategorie) {
		this.idCategorie = idcategorie;
	}

}
