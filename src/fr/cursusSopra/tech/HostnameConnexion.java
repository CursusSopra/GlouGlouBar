package fr.cursusSopra.tech;

public class HostnameConnexion {
	private static HostnameConnexion instance = null;

	private String hostName = "";

	private HostnameConnexion() {
	}

	public static HostnameConnexion getInstance() {
		if (instance == null) {
			instance = new HostnameConnexion();
		}
		return instance;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
}
