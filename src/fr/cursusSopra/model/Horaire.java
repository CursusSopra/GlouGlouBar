/**
 * Pierre Peclet
 */

package fr.cursusSopra.model;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import fr.cursusSopra.tech.PostgresConnection;

public class Horaire {
	private int idHoraire;
	private int idBar;
	private int idJour;
	private String heureDebut;
	private String heureFin;

	public Horaire() {
	}

	/**
	 * Récupère le mot associé au numéro de jour
	 * 
	 * @return le jour en toute lettre
	 */
	public String getNomJour() {
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT jour FROM jours WHERE idjour = ?";
		PreparedStatement ps = null;
		try {
			 ps = cnx.prepareStatement(query);
			
			ps.setInt(1, idJour);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des critères spéciaux
			if (rs.next()) {
				return rs.getString("jour");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "Jour inconnu";
	}

	/**
	 * Récupère la liste de tous les horaires correspondant à un bar dans la
	 * base de données
	 * 
	 * @return List<Horaire>
	 */
	public static List<Horaire> getListeHoraires(int idBar) {
		List<Horaire> lstHoraireBar = new ArrayList<Horaire>();
		Connection cnx = PostgresConnection.GetConnexion();

		// requete de selection de tous les bars
		String query = "SELECT idhoraire, idbar, idjour, EXTRACT(HOUR FROM heuredebut) AS heureouverture, EXTRACT(MINUTE FROM heuredebut) AS minuteouverture, EXTRACT(HOUR FROM heurefin) AS heurefermeture, EXTRACT(MINUTE FROM heurefin) AS minutefermeture FROM horaires WHERE idbar = ? ORDER BY idjour, heuredebut";
		PreparedStatement ps = null;
		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ResultSet rs = ps.executeQuery();

			// remplissage tant qu'on trouve des critères spéciaux
			while (rs.next()) {
				Horaire newHoraire = new Horaire();
				newHoraire.idHoraire = rs.getInt("idhoraire");
				newHoraire.idBar = rs.getInt("idbar");
				newHoraire.idJour = rs.getInt("idjour");
				String heureOuverture = Integer.toString((int) rs
						.getDouble("heureouverture"));
				String minuteOuverture = Integer.toString((int) rs
						.getDouble("minuteouverture"));
				newHoraire.heureDebut = heureOuverture + ":" + minuteOuverture;
				String heureFermeture = Integer.toString((int) rs
						.getDouble("heurefermeture"));
				String minuteFermeture = Integer.toString((int) rs
						.getDouble("minutefermeture"));
				newHoraire.heureFin = heureFermeture + ":" + minuteFermeture;
				lstHoraireBar.add(newHoraire);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return lstHoraireBar;
	}

	/**
	 * Ajoute un horaire dans la base de données à partir des données connues
	 * dans l'objet ci-présent
	 * 
	 * @return 1 si la création s'est effectuée correctement, 0 sinon
	 */
	public int SaveHoraire() {
		Connection cnx = PostgresConnection.GetConnexion();

		String query = "INSERT INTO horaires (idbar, idjour, heuredebut, heurefin) VALUES (?,?,TIME '"
				+ heureDebut + "',TIME '" + heureFin + "')";
		PreparedStatement ps = null;

		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idBar);
			ps.setInt(2, idJour);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	/**
	 * Détruit l'horaire avec l'idhoraire de l'objet en cours dans la base de
	 * données
	 * 
	 * @return 1 si la destruction s'est effectuée correctement, 0 sinon
	 */
	public int Delete() {
		Connection cnx = PostgresConnection.GetConnexion();
		String query = "DELETE FROM horaires WHERE idhoraire = ?";
		PreparedStatement ps = null;
		
		try {
			ps = cnx.prepareStatement(query);
			ps.setInt(1, idHoraire);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public int getIdHoraire() {
		return idHoraire;
	}

	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

	public int getIdJour() {
		return idJour;
	}

	public void setIdJour(int idJour) {
		this.idJour = idJour;
	}

	public String getHeureDebut() {
		return heureDebut;
	}

	public void setHeureDebut(String heureDebut) {
		this.heureDebut = heureDebut;
	}

	public String getHeureFin() {
		return heureFin;
	}

	public void setHeureFin(String heureFin) {
		this.heureFin = heureFin;
	}
}
