<!-- Florian -->

<%@ taglib prefix="s" uri="/struts-tags"%>

<div>

<h2>Struts2 File Upload & Save Example</h2>
<s:actionerror />

<s:form action="userImage" method="post" enctype="multipart/form-data">
	<s:file name="userImage" label="User Image" />
	<s:submit value="Upload" align="center" />
	<input type="hidden" name="idBar" id="ididBar"
					value='<s:property value="idBar" />' /> <input type="hidden"
					name="idNotes" id="idNotes" /> <input type="hidden"
					name="idCriteres" id="idCriteres" />
</s:form>


</div>