//Bar.java
//Virgile

package fr.cursusSopra.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.Adresse;
import fr.cursusSopra.tech.BarCategorie;
import fr.cursusSopra.tech.BarCommentaire;
import fr.cursusSopra.tech.BarCritere;
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

	private String[] tabJoursOuvert;
	private String[] tabHeureDebutOuvert;
	private String[] tabHeureFinOuvert;

	private List<Horaire> lstHoraires;
	private List<CategorieBar> lstCategorie;
	private List<Critere> lstCritere;
	
	private List<BarCritere> lstBarCritere;
	private List<BarCategorie> lstBarCategorie;
	private List<BarEvaluation> lstEvals;
	private List<BarCommentaire> lstComms;

	public List<BarCommentaire> getLstComms() {
		List<BarCommentaire> lstComms = new ArrayList<BarCommentaire>();

		Connection cnx = PostgresConnection.GetConnexion();
		String query = "SELECT * FROM v_comm_notes where idbar=? and idcriteval=5";
		PreparedStatement ps;
		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouv�
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

	public List<Horaire> getLstHoraires() {
		return lstHoraires;
	}
	
	public void setLstBarCritere(List<BarCritere> lstBarCritere) {
		this.lstBarCritere = lstBarCritere;
	}

	public List<BarCritere> getLstBarCritere() {
		return lstBarCritere;
	}
	
	public void setLstBarCategorie(List<BarCategorie> lstBarCategorie) {
		this.lstBarCategorie = lstBarCategorie;
	}

	public List<BarCategorie> getLstBarCategorie() {
		return lstBarCategorie;
	}

	public void setTabJoursOuvert(String[] tabJoursOuvert) {
		this.tabJoursOuvert = tabJoursOuvert;
	}

	public void setTabHeureDebutOuvert(String[] tabHeureDebutOuvert) {
		this.tabHeureDebutOuvert = tabHeureDebutOuvert;
	}

	public void setTabHeureFinOuvert(String[] tabHeureFinOuvert) {
		this.tabHeureFinOuvert = tabHeureFinOuvert;
	}

	public List<BarEvaluation> getLstEvals() {
		List<BarEvaluation> lstEval = new ArrayList<BarEvaluation>();

		Connection cnx = PostgresConnection.GetConnexion();
		String query = "SELECT AVG(note) as note, libcourt FROM critiques INNER JOIN evaluations USING (idcritique)     INNER JOIN critereseval USING (idcriteval) WHERE idbar = ? GROUP BY libcourt";
		PreparedStatement ps;
		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouv�
			while (rs.next()) {
				BarEvaluation be = new BarEvaluation();
				be.setLibCourt(rs.getString("libcourt"));
				be.setNote(rs.getDouble("note"));
				lstEval.add(be);
			}
		} catch (SQLException e) {
		}

		return lstEval;
	}

	public List<Double> getLstNotes() {

		double globalNote;
		List<Double> lst = new ArrayList<>();

		Connection cnx = PostgresConnection.GetConnexion();
		// requete de selection du bar d'idbar = id
		String query = "SELECT SUM (note) as total, count (*) as idx FROM evaluations INNER JOIN critiques USING (idcritique) WHERE (idbar = ? and idcriteval=?)";
		int i;
		for (i = 1; i <= 5; i++) {
			globalNote = 0;
			try {
				PreparedStatement ps = cnx.prepareStatement(query);
				ps.setInt(1, idBar);
				ps.setInt(2, i);
				ResultSet rs = ps.executeQuery();

				// remplissage de l'objet si le bar est trouv�
				if (rs.next()) {
					globalNote = (double) rs.getInt("total")
							/ (double) rs.getInt("idx");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			lst.add(globalNote);
		}
		return lst;
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

	public void setShortDescription(String shortDescription) {

	}

	public Adresse getAdresse() {
		return adresse;
	}

	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}

	public Bar() {
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

	/**
	 * Constructeur de l'objet bar qui r�cup�re le bar correspondant � l'id dans
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
		// requete de selection du bar d'idbar = id
		String query = "SELECT nom, numtel, site, description FROM bars WHERE idbar = ?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouv�
			if (rs.next()) {
				fillBar(this, rs);
//				buildAdresse();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * R�cup�re la liste de tous les bars dans la base de donn�es et cr�e les
	 * objets Bar correspondant
	 * 
	 * @return List<Bar>
	 */
	public static List<Bar> getListeDesBars() {
		List<Bar> lstBar = new ArrayList<Bar>();
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT idbar, nom, numtel, site, description FROM bars ";
		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des bars
			while (rs.next()) {
				Bar newBar = new Bar();
				newBar.idBar = rs.getInt("idbar");
				fillBar(newBar, rs);
				newBar.lstHoraires = Horaire.getListeHoraires(newBar.idBar);
				lstBar.add(newBar);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lstBar;
	}

	/**
	 * Remplit un bar avec les �lements tir�s de la base de donn�es
	 * 
	 * @param thisBar
	 *            : le bar qu'on est en train de remplir
	 * @param rs
	 *            : r�sultat de la requ�te contenant les infos du bar
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

//	private void buildAdresse() {
//		Connection cnx = PostgresConnection.GetConnexion();
//
//		// requete de selection du bar d'idbar = id
//		String query = "SELECT * from v_adressebar where idbar = ?";
//
//		try {
//			PreparedStatement ps = cnx.prepareStatement(query);
//			ps.setInt(1, idBar);
//			ResultSet rs = ps.executeQuery();
//
//			// remplissage de l'objet si le bar est trouv�
//			if (rs.next()) {
//				Ville ville = new Ville();
//				ville.setCp(rs.getString("cp"));
//				ville.setVille(rs.getString("ville"));
//				adresse.setVille(ville);
//				adresse.setVoie(rs.getString("voie"));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

	public int CreateHoraires() {
		Connection cnx = PostgresConnection.GetConnexion();
		Statement state;

		try {
			state = cnx.createStatement();
			int retour = 1;
			for (int i = 0; i < tabJoursOuvert.length; i++) {
				String queryHoraires = "INSERT INTO horaires (idbar, idjour, heuredebut, heurefin) VALUES ("
						+ idBar
						+ ", "
						+ Integer.parseInt(tabJoursOuvert[i])
						+ ", TIME '"
						+ tabHeureDebutOuvert[i]
						+ "', TIME '"
						+ tabHeureFinOuvert[i] + "')";
				state.executeUpdate(queryHoraires);
			}
			return retour;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * Ajoute un bar dans la base de donn�es � partir des donn�es connues dans
	 * l'objet ci-pr�sent
	 * 
	 * @return 1 si la cr�ation s'est effectu�e correctement, 0 sinon
	 */
	public int Create() {
		Connection cnx = PostgresConnection.GetConnexion();

		int idAdresse = Adresse.CreateAdresse(this);

		String query = "INSERT INTO bars (nom,numtel,site,description, idadresse) VALUES (?,?,?,?,?) RETURNING idbar";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setString(1, nom);
			ps.setString(2, numTel);
			ps.setString(3, site);
			ps.setString(4, description);
			ps.setInt(5, idAdresse);

			ResultSet rs = ps.executeQuery();
			rs.next();
			// L'id du bar cr�� automatiquement est r�cup�r�
			int idBar = rs.getInt(1);
			this.idBar = idBar;

			// On remplit la liste des horaires
			CreateHoraires();

			// On remplit la table "criteresbars"
			if (lstBarCritere.size() != 0) {
				Critere.CreateCriteres(this);
			}
			// On remplit la table "categoriesbars"
			if (lstBarCategorie.size() != 0) {
				CategorieBar.CreateCategories(this);
			}
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * Met � jour un bar dans la base de donn�es � partir des donn�es connues
	 * dans l'objet ci-pr�sent
	 * 
	 * @return 1 si la modification s'est effectu�e correctement, 0 sinon
	 */
	public int Update() {
		Connection cnx = PostgresConnection.GetConnexion();
		String query = "UPDATE bars SET " + "nom = ? ," + "numtel = ? ,"
				+ "site = ? ," + "description = ? ," + "WHERE idbar = ?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setString(1, nom);
			ps.setString(2, numTel);
			ps.setString(3, site);
			ps.setString(4, description);
			ps.setInt(5, idBar);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * D�truit le bar avec l'idbar de l'objet en cours dans la base de donn�es
	 * 
	 * @return 1 si la destruction s'est effectu�e correctement, 0 sinon
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
}