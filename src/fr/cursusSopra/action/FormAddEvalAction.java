package fr.cursusSopra.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.CriteresEval;

public class FormAddEvalAction extends ActionSupport  {

	private static final long serialVersionUID = 1L;
	
	

	private List<CriteresEval> lstCriteresEval;
	private int idBar;
	
	public String execute() {
		lstCriteresEval = CriteresEval.lstCriteresEval();
		
		return SUCCESS;
	}

	public List<CriteresEval> getLstCriteresEval() {
		return lstCriteresEval;
	}

	public void setLstCriteresEval(List<CriteresEval> lstCriteresEval) {
		this.lstCriteresEval = lstCriteresEval;
	}

	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

}
