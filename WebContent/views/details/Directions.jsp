<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="map_container" class="map_container">
	<div id="map_canvas" class="map_canvas"></div>
</div>

<input type="hidden" name = "nomMap" id="nomMap" value='<s:property value="leBar.nom"/>'/>
<input type="hidden" name = "lat" id="lat" value='<s:property value="leBar.adresse.latitude"/>'/>
<input type="hidden" name = "longi" id="longi" value='<s:property value="leBar.adresse.longitude"/>'/>