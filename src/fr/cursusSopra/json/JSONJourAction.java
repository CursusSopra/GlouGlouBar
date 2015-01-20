//Nicolas

package fr.cursusSopra.json;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;

import fr.cursusSopra.model.Jour;

public class JSONJourAction {
	private List<Jour> listeDesJours = new ArrayList<>();
	
	public JSONJourAction() throws SQLException {
		setListeDesJours(Jour.getLstJours());
	}
	
	public String execute() {
		return Action.SUCCESS;
	}

	public List<Jour> getListeDesJours() {
		return listeDesJours;
	}

	public void setListeDesJours(List<Jour> listeDesJours) {
		this.listeDesJours = listeDesJours;
	}
}
