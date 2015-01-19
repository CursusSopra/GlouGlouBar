//Florian

package fr.cursusSopra.model;

import java.sql.*;

import fr.cursusSopra.tech.Adresse;
import fr.cursusSopra.tech.PostgresConnection;

public class Image {

	private int idBar;
	private String nomImage;
	private boolean isPrincipal;
	
	// Constructeur vide
	public Image() {
	}

	// Constructeur
	public Image(int idBarExt, String nomImageExt) {
		idBar = idBarExt;
		nomImage = nomImageExt;
	}
	
	public int SaveImage() {
		Connection cnx = PostgresConnection.GetConnexion();
		String queryAddEval = "INSERT INTO images (idbar,nomimage, isprincipal) VALUES (?,?, FALSE)";
		PreparedStatement psAddEval;
		try {
			psAddEval = cnx.prepareStatement(queryAddEval);
			psAddEval.setInt(1, idBar);
			psAddEval.setString(2, nomImage);

			int result = psAddEval.executeUpdate();

			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}

	}
	
	public static Image getMainImage(int idBar) {
		// TODO Auto-generated method stub
		Image image = new Image();
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT idbar, nomimage FROM images WHERE idbar =? AND isprincipal=TRUE";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des criteres
			if (rs.next()) {
				image.idBar=rs.getInt("idBar");
				image.nomImage=rs.getString("nomImage");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return image;
	}

	public String getNomImage() {
		return nomImage;
	}

	public void setNomImage(String nomImage) {
		this.nomImage = nomImage;
	}

	public boolean isPrincipal() {
		return isPrincipal;
	}

	public void setPrincipal(boolean isPrincipal) {
		this.isPrincipal = isPrincipal;
	}

	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}



}
