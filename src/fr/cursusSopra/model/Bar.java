//Virgile

package fr.cursusSopra.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
	private String voie;
	private String ville;
	private String cp;
	private String shortDescription;
	private int[] tabCriteres;
	private int[] tabCategories;
	private List<Double> lstNotes;

	private String[] tabJoursOuvert;
	private String[] tabHeureDebutOuvert;
	private String[] tabHeureFinOuvert;

	private List<Horaire> lstHoraires;
	private List<CategorieBar> lstCategorie;
	private List<Critere> lstCritere;

	private List<BarEvaluation> lstEvals;

	private List<BarCommentaire> lstComms;

	public List<BarCommentaire> getLstComms() {
		List<BarCommentaire> lstComms = new ArrayList<BarCommentaire>();

		Connection cnx = PostgresConnection.GetConnexion();
		String query = "SELECT comm, EXTRACT(DATE FROM datecomm) AS datecomm, note from critiques inner join evaluations using (idcritique) where idbar=? and idcriteval=5";
		PreparedStatement ps;
		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouv�
			while (rs.next()) {
				BarCommentaire bc = new BarCommentaire();
				bc.setComm (rs.getString("comm"));
				bc.setDateComm(rs.getDate("datecomm"));
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

	public void setTabCategories(int[] tabCategories) {
		this.tabCategories = tabCategories;
	}

	public void setTabCriteres(int[] tabCriteres) {
		this.tabCriteres = tabCriteres;
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

	public void setVoie(String voie) {
		this.voie = voie;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public void setCp(String cp) {
		this.cp = cp;
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

	public String getVoie() {
		return voie;
	}

	public String getVille() {
		return ville;
	}

	public String getCp() {
		return cp;
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
		// requete de selection du bar d'idbar = id
		String query = "SELECT nom, numtel, site, description FROM bars WHERE idbar = ?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouv�
			if (rs.next()) {
				fillBar(this, rs);
				buildAdresse();
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

	private void buildAdresse() {
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection du bar d'idbar = id
		String query = "SELECT voie, cp, ville from adresses inner join bars using(idadresse) inner join villes using (cp) where idbar = ?";

		try {
			PreparedStatement ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage de l'objet si le bar est trouv�
			if (rs.next()) {
				setVoie(rs.getString("voie"));
				setCp(rs.getString("cp"));
				setVille(rs.getString("ville"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Ajoute une adresse � un bar. Appel�e dans la m�thode Create()
	 * 
	 * @return
	 */
	public int CreateAdresse() {
		Connection cnx = PostgresConnection.GetConnexion();

		String queryCp = "SELECT cp FROM villes WHERE ville=?";
		String queryAdresse = "INSERT INTO adresses (voie, cp) VALUES (?, ?) RETURNING idadresse";

		try {
			// R�cup�ration du code postal de la ville s�lectionn�e
			PreparedStatement psCp = cnx.prepareStatement(queryCp);
			psCp.setString(1, ville);
			ResultSet rsCp = psCp.executeQuery();
			rsCp.next();
			setCp(rsCp.getString("cp"));

			// Insertion de l'adresse dans la base de donn�es
			PreparedStatement psAdresse = cnx.prepareStatement(queryAdresse);
			psAdresse.setString(1, voie);
			psAdresse.setString(2, cp);
			// R�cup�ration de l'idadresse
			ResultSet rsAdresse = psAdresse.executeQuery();
			rsAdresse.next();
			return rsAdresse.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * Ajoute des crit�res � un bar. Appel�e dans la m�thode Create()
	 * 
	 * @return
	 */
	public int CreateCriteres(int idBar) {
		Connection cnx = PostgresConnection.GetConnexion();

		String queryCriteres = "INSERT INTO criteresbars (idbar, idcritere) VALUES (?, ?)";

		try {
			// R�cup�ration du code postal de la ville s�lectionn�e
			PreparedStatement psCriteres = cnx.prepareStatement(queryCriteres);
			int i;
			int retour = 1;
			for (i = 0; i < tabCriteres.length; i++) {
				psCriteres.setInt(1, idBar);
				psCriteres.setInt(2, tabCriteres[i]);
				retour = psCriteres.executeUpdate();
			}
			return retour;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * Ajoute des cat�gories � un bar. Appel�e dans la m�thode Create()
	 * 
	 * @return
	 */
	public int CreateCategories(int idBar) {
		Connection cnx = PostgresConnection.GetConnexion();

		String queryCategories = "INSERT INTO categoriesbars (idbar, idcategorie) VALUES (?, ?)";

		try {
			// R�cup�ration du code postal de la ville s�lectionn�e
			PreparedStatement psCategories = cnx
					.prepareStatement(queryCategories);
			int i;
			int retour = 1;
			for (i = 0; i < tabCategories.length; i++) {
				psCategories.setInt(1, idBar);
				psCategories.setInt(2, tabCategories[i]);
				retour = psCategories.executeUpdate();
			}
			return retour;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int CreateHoraires(int idBar) {
		Connection cnx = PostgresConnection.GetConnexion();

		String queryHoraires = "INSERT INTO horaires (idbar, idjour, heuredebut, heurefin) VALUES (?, ?, TIME ?, TIME ?)";

		try {
			// R�cup�ration du code postal de la ville s�lectionn�e
			PreparedStatement psHoraires = cnx.prepareStatement(queryHoraires);
			int i;
			int retour = 1;
			for (i = 0; i < tabJoursOuvert.length; i++) {
				psHoraires.setInt(1, idBar);
				psHoraires.setInt(2, Integer.parseInt(tabJoursOuvert[i]));
				psHoraires.setString(3, tabHeureDebutOuvert[i]);
				psHoraires.setString(4, tabHeureFinOuvert[i]);

				retour = psHoraires.executeUpdate();
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

		int idAdresse = CreateAdresse();

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
			// On remplit la liste des horaires
			for (int i = 0; i < tabJoursOuvert.length; i++) {
				CreateHoraires(idBar);
			}
			// On remplit la table "criteresbars"
			if (tabCriteres.length != 0) {
				CreateCriteres(idBar);
			}
			// On remplit la table "categoriesbars"
			if (tabCategories.length != 0) {
				CreateCategories(idBar);
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