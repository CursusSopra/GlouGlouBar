package fr.cursusSopra.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.PostgresConnection;

public class CategorieBar {
	private int idCategorie;
	private String categorieBar;
	private int idBar;

	public CategorieBar() {
	}

	public int getIdCategorie() {
		return idCategorie;
	}

	public void setIdCategorie(int idCategorie) {
		this.idCategorie = idCategorie;
	}

	public String getCategorieBar() {
		return categorieBar;
	}

	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

	/**
	 * Ajoute des catégories à un bar. Appelée dans la méthode Create()
	 * 
	 * @return
	 */
	public void SaveCategorie() {
		Connection cnx = PostgresConnection.GetConnexion();
		String queryCategories = "INSERT INTO categoriesbars (idbar, idcategorie) VALUES (?, ?)";
		try {
			// Récupération du code postal de la ville sélectionnée
			PreparedStatement psCategories = cnx
					.prepareStatement(queryCategories);
			psCategories.setInt(1, idBar);
			psCategories.setInt(2, idCategorie);
			psCategories.executeUpdate();
			psCategories.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Récupère la liste de toutes les catégories de bars dans la base de
	 * données et crée les objets CategorieBar correspondant
	 * 
	 * @return List<Bar>
	 */
	public static List<CategorieBar> getListeCategoriesBar() {
		List<CategorieBar> lstCategorieBar = new ArrayList<CategorieBar>();
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT idcategorie, categoriebar FROM categories";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des catégories
			while (rs.next()) {
				CategorieBar newCategorieBar = new CategorieBar();
				newCategorieBar.idCategorie = rs.getInt("idcategorie");
				newCategorieBar.categorieBar = rs.getString("categoriebar");
				lstCategorieBar.add(newCategorieBar);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lstCategorieBar;
	}

	public static List<CategorieBar> listeCategorie(int idBar) {
		List<CategorieBar> lstCategorie = new ArrayList<CategorieBar>();

		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT idcategorie, categoriebar FROM categoriesbars inner join bars using (idbar) inner join categories using (idcategorie) WHERE idbar = ?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des catégories
			while (rs.next()) {
				CategorieBar categorieBar = new CategorieBar();
				categorieBar.categorieBar = rs.getString("categoriebar");
				categorieBar.idCategorie = rs.getInt("idcategorie");
				lstCategorie.add(categorieBar);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lstCategorie;
	}
}