<%@ taglib uri="/struts-tags" prefix="s"%>

<s:url action="detailsBar" var="db">
	<s:param name="idBar">
		<s:property value="idBar" />
	</s:param>
</s:url>
<div class="vignette col-lg-3 col-sm-4">
	<a href="<s:property value='#db'/>" class="linkStyle"> <img
		src="<s:property value="lienImage"/>" class="vignetteImage"
		title="<s:property value="nom" />" />

		<p class="lead">
			<s:property value="nom" />
		</p> <input id="<s:property value="idBar" />" disabled="true"
		type="number" class="handPointer rating " min=0 max=5 step=0.1
		data-size="sm" data-rtl="false"
		value="<s:property value="lstEvals[4].note" />"
		data-show-caption="false" data-show-clear="false"
		data-read-only="true" data-hover-enabled="false" /> <span
		class="description"> <s:property value="shortDescription" />
	</span>
	</a>
</div>