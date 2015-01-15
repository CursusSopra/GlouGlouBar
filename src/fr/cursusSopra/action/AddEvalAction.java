//Propriete Adeline Et Florian

package fr.cursusSopra.action;

import java.util.*;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Critique;

public class AddEvalAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private int idBar;
	private String idNotes;
	private String idCriteres;
	private List<Integer> notes;
	private List<Integer> criteres;
	private String commentaire;

	public String execute() {
		notes = new ArrayList<Integer>();
		criteres = new ArrayList<Integer>();
		String[] party = idNotes.split(",");
		String[] critTab= idCriteres.split(",");

		for (int i = 0; i < party.length ; i++) {
			notes.add(  Integer.parseInt( party[i] ) );
			criteres.add(  Integer.parseInt( critTab[i] )  );
		}

		Critique critTest = new Critique();
		critTest.AddCritique(notes,criteres, commentaire, idBar);

		return SUCCESS;
	}
	

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

	public void setIdNotes(String idNotes) {
		this.idNotes = idNotes;
	}


	public void setIdCriteres(String idCriteres) {
		this.idCriteres = idCriteres;
	}

}
