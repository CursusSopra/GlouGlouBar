package fr.cursusSopra.action;
import java.util.List;

import fr.cursusSopra.model.Bar;
import fr.cursusSopra.model.CriteresEval;

import com.opensymphony.xwork2.ActionSupport;

public class DetailsBarAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2448904005907254703L;

	private int idBar;


	private Bar leBar;
	
	//Necessaire a l'ajout d'evaluation
	private List<CriteresEval> lstCriteresEval;
	
	public List<CriteresEval> getLstCriteresEval() {
		return lstCriteresEval;
	}

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
		lstCriteresEval = CriteresEval.lstCriteresEval();
		
		return SUCCESS;
	}
}
