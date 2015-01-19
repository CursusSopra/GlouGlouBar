//Propriete de Florian

package fr.cursusSopra.model;

import java.sql.*;


import fr.cursusSopra.tech.PostgresConnection;

public class Images {

	
	private int idbar;
	private String nomImage;
	private boolean isPrincipal;

	// Constructeur vide
	public Images() {}
	
	//Constructeur 
	public Images(int idbarExt, String nomImageExt) {
		idbar = idbarExt;
		nomImage = nomImageExt;
	}


}
