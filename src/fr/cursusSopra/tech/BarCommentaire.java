package fr.cursusSopra.tech;

import java.sql.Date;

public class BarCommentaire {
	
	private int note;
	private String comm;
	private Date dateComm;
	
	public int getNote() {
		return note;
	}
	public void setNote(int note) {
		this.note = note;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public Date getDateComm() {
		return dateComm;
	}
	public void setDateComm(Date dateComm) {
		this.dateComm = dateComm;
	}

}
