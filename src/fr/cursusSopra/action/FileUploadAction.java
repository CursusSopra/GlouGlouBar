//Florian

package fr.cursusSopra.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import fr.cursusSopra.model.Image;

public class FileUploadAction extends ActionSupport implements
		ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File userImage;
	private String userImageContentType;
	private String userImageFileName;
	private int idBar;

	private HttpServletRequest servletRequest;

	public String execute() {
		try {
			String imageName=idBar+userImageFileName;
			String filePath = servletRequest.getSession().getServletContext().getRealPath("/content/images");
			System.out.println("Server path:" + filePath );
			File fileToCreate = new File(filePath, imageName);
			FileUtils.copyFile(this.userImage, fileToCreate);
			
			Image newImage=new Image(idBar,imageName);
			newImage.SaveImage();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
	}

	public File getUserImage() {
		return userImage;
	}

	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}

	public String getUserImageContentType() {
		return userImageContentType;
	}

	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}

	public String getUserImageFileName() {
		return userImageFileName;
	}

	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;

	}

	public int getIdBar() {
		return idBar;
	}

	public void setIdBar(int idBar) {
		this.idBar = idBar;
	}

}
