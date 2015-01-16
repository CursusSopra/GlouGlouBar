<%@ taglib prefix="s" uri="/struts-tags"%>

	<img src="content/images/glougloulogo.jpg" width="300px;"
		height="60px;" />
	<div class="row" style="margin-top: 50px; margin-left: 50px;">

		<s:iterator value="lstBars">

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
					value="<s:property value="lstNotes[4]" />"
					data-show-caption="false" data-show-clear="false"
					data-read-only="true" data-hover-enabled="false" /> <span
					class="description"> <s:property value="shortDescription" />
				</span>
				</a>
			</div>

		</s:iterator>

	</div>
	<a href="<s:url action='creationBar' />">Création d'un nouveau bar</a>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <link -->
<!-- 	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet"> -->

<!-- <link href="_css/glouglouStyle.css" type="text/css" rel="stylesheet" /> -->
<!-- <link href="css/star-rating.min.css" media="all" rel="stylesheet" -->
<!-- 	type="text/css" /> -->


<!-- <title>Index</title> -->

<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->