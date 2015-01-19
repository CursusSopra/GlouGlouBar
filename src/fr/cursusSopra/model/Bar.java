//Bar.java
//Virgile

package fr.cursusSopra.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.Adresse;
import fr.cursusSopra.tech.BarCommentaire;
import fr.cursusSopra.tech.BarEvaluation;
import fr.cursusSopra.tech.PostgresConnection;

public class Bar {
	private int idBar;
	private String nom;
	private String numTel;
	private String site;
	private String description;
	private String lienImage;
	private Adresse adresse;
	private String shortDescription;
	private List<Double> lstNotes;
	private List<Horaire> lstHoraires;
	private List<CategorieBar> lstCategorie;
	private List<Critere> lstCritere;
	private List<BarEvaluation> lstEvals;
	private List<BarCommentaire> lstComms;
	private Image mainImage;
	private List<Image> lstImage;
	
	public Bar() {
	}

	/**
	 * Constructeur de l'objet bar qui récupère le bar correspondant à l'id dans
	 * la table
	 * 
	 * @param id
	 */
	public Bar(int id) {
		Connection cnx = PostgresConnection.GetConnexion();
		idBar = id;
		lstHoraires = Horaire.getListeHoraires(idBar);
		lstCategorie = CategorieBar.listeCategorie(idBar);
		lstCritere = Critere.listeCritere(idBar);
		adresse = Adresse.getAdresse(idBar);
		mainImage = Image.getMainImage(idBar);
		setLstImage(Image.getAllImage(idBar));
		// requete de selection du bar d'idbar = id
		String query = "SELECT nom, numtel, site, description FROM bars WHERE idbar = ?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouvé
			if (rs.next()) {
				fillBar(this, rs);
//				buildAdresse();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<BarCommentaire> getLstComms() {
		List<BarCommentaire> lstComms = new ArrayList<BarCommentaire>();

		Connection cnx = PostgresConnection.GetConnexion();
		String query = "SELECT * FROM v_comm_notes where idbar=? and idcriteval=5";
		PreparedStatement ps;
		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouvé
			while (rs.next()) {
				BarCommentaire bc = new BarCommentaire();
				bc.setComm(rs.getString("comm"));
				bc.setDateComm(rs.getString("datecomm"));
				bc.setNote(rs.getInt("note"));
				lstComms.add(bc);
			}
		} catch (SQLException e) {
		}
		return lstComms;
	}

	public List<BarEvaluation> getLstEvals() {
		List<BarEvaluation> lstEval = new ArrayList<BarEvaluation>();

		Connection cnx = PostgresConnection.GetConnexion();
		String query = "SELECT AVG(note) as note, libcourt, liblong FROM critiques INNER JOIN evaluations USING (idcritique)     INNER JOIN critereseval USING (idcriteval) WHERE idbar = ? GROUP BY libcourt, liblong, tri ORDER BY tri";
		PreparedStatement ps;
		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouvé
			while (rs.next()) {
				BarEvaluation be = new BarEvaluation();
				be.setLibCourt(rs.getString("libcourt"));
				be.setNote(rs.getDouble("note"));
				be.setLibLong(rs.getString("liblong"));
				lstEval.add(be);
			}
		} catch (SQLException e) {
		}

		return lstEval;
	}

	public String getLienImage() {
		return ("content/images/" + String.valueOf(idBar) + ".jpg");
	}

	public String getShortDescription() {
		int len = this.description.length();
		int maxlength = 40;
		if (len < maxlength) {
			return description;
		} else {
			int index = this.description.indexOf(" ", maxlength);
			return this.description.substring(0, index) + " [...]";
		}
	}

	/**
	 * Récupère la liste de tous les bars dans la base de données et crée les
	 * objets Bar correspondant
	 * 
	 * @return List<Bar>
	 */
	public static List<Bar> getListeDesBars() {
		List<Bar> lstBar = new ArrayList<Bar>();
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT idbar, nom, numtel, site, description FROM bars";
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des bars
			while (rs.next()) {
				Bar newBar = new Bar();
				newBar.idBar = rs.getInt("idbar");
				fillBar(newBar, rs);
				newBar.lstHoraires = Horaire.getListeHoraires(newBar.idBar);
				newBar.mainImage=Image.getMainImage(newBar.idBar);
				newBar.lstImage=Image.getAllImage(newBar.idBar);
				lstBar.add(newBar);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lstBar;
	}

	/**
	 * Remplit un bar avec les élements tirés de la base de données
	 * 
	 * @param thisBar
	 *            : le bar qu'on est en train de remplir
	 * @param rs
	 *            : résultat de la requête contenant les infos du bar
	 */
	private static void fillBar(Bar thisBar, ResultSet rs) {
		try {
			thisBar.nom = rs.getString("nom");
			thisBar.numTel = rs.getString("numtel");
			thisBar.site = rs.getString("site");
			thisBar.description = rs.getString("description");
		} catch (SQLException e) {
		}
	}

	/**
	 * Ajoute un bar dans la base de données à partir des données connues dans
	 * l'objet ci-présent
	 * 
	 * @return 1 si la création s'est effectuée correctement, 0 sinon
	 */
	public int SaveBar() {
		Connection cnx = PostgresConnection.GetConnexion();
		String query = "INSERT INTO bars (nom,numtel,site,description, idadresse) VALUES (?,?,?,?,?) RETURNING idbar";
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setString(1, nom);
			ps.setString(2, numTel);
			ps.setString(3, site);
			ps.setString(4, description);
			ps.setInt(5, adresse.getIdAdresse());

			ResultSet rs = ps.executeQuery();
			rs.next();
			// L'id du bar créé automatiquement est récupéré
			int idBar = rs.getInt(1);
			this.idBar = idBar;

			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * Met à jour un bar dans la base de données à partir des données connues
	 * dans l'objet ci-présent
	 * 
	 * @return 1 si la modification s'est effectuée correctement, 0 sinon
	 */
	public int Update() {
		Connection cnx = PostgresConnection.GetConnexion();
		String query = "UPDATE bars SET nom=?, numtel=?, site=?, description=? WHERE idbar=?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setString(1, nom);
			ps.setString(2, numTel);
			ps.setString(3, site);
			ps.setString(4, description);
			ps.setInt(5, idBar);
			System.out.println("Coucou" + nom + numTel + site + description + idBar);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * Détruit le bar avec l'idbar de l'objet en cours dans la base de données
	 * 
	 * @return 1 si la destruction s'est effectuée correctement, 0 sinon
	 */
	public int Delete() {
		Connection cnx = PostgresConnection.GetConnexion();
		String query = "DELETE FROM bars WHERE idbar = ?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public void setLstHoraires(List<Horaire> lstHoraires) {
		this.lstHoraires = lstHoraires;
	}
	
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getNumTel() {
		return numTel;
	}

	public void setNumTel(String numTel) {
		this.numTel = numTel;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

	public int getIdBar() {
		return idBar;
	}

	public List<CategorieBar> getLstCategorie() {
		return lstCategorie;
	}
	
	public List<Critere> getLstCritere() {
		return lstCritere;
	}
	
	public List<Horaire> getLstHoraires() {
		return lstHoraires;
	}
	
	public void setLstCategorie(List<CategorieBar> lstCategorie) {
		this.lstCategorie = lstCategorie;
	}

	public void setShortDescription(String shortDescription) {

	}
	
	public void setLstCritere(List<Critere> lstCritere) {
		this.lstCritere = lstCritere;
	}

	public Adresse getAdresse() {
		return adresse;
	}

	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}


	public Image getMainImage() {
		return mainImage;
	}

	public void setMainImage(Image mainImage) {
		this.mainImage = mainImage;
	}

	public List<Image> getLstImage() {
		return lstImage;
	}

	public void setLstImage(List<Image> lstImage) {
		this.lstImage = lstImage;
	}
}