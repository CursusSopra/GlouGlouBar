<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="row" style="margin-top: 50px; margin-left: 50px;">

	<s:iterator value="lstBars">

		<s:url action="detailsBar" var="db">
			<s:param name="idBar">
				<s:property value="idBar" />
			</s:param>
		</s:url>
		<div class="col-lg-3 col-sm-4"
			onmouseover="this.style.background='#f150a2'"
			onmouseout="this.style.background='white';">
			<a href="<s:property value='#db'/>" class="linkStyle"> <img
				src="<s:property value="lienImage"/>" width="300" height="200"
				title="<s:property value="nom" />" />

				<p class="lead">
					<s:property value="nom" />
				</p> <input name="accueil" id="<s:property value="idBar" />"
				type="number" class="rating" min=0 max=5 step=0.1 data-size="sm"
				data-rtl="false" value="<s:property value="globalNote"/>"
				data-show-caption="false" data-show-clear="false"
				data-read-only="true" data-hover-enabled="false" />

				<h5>
					<s:property value="shortDescription" />
				</h5>
			</a>
		</div>

	</s:iterator>

</div>
<a href="<s:url action='creationBar' />">Création d'un nouveau bar</a>