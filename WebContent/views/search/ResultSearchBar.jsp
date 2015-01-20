
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container-fluid">

<div class="row bars">
		<div class="col-lg-9 col-md-9 col-sm-9">
			<div class="panel panel-primary panel-danger">
					<div class="panel-heading"">
						Où boire un verre ce soir ?
					</div>
					<div class="panel-body panelbd">
							<s:iterator value="lstBars">
								<s:url action="detailsBar" var="db">
									<s:param name="idBar">
										<s:property value="idBar" />
									</s:param>
								</s:url>
								<div class="vignette col-md-4 col-sm-2">
<!-- 								col-lg-3 col-sm-4 -->
									<a href="<s:property value='#db'/>" class="linkStyle"> <div class="crop"><img
										src="<s:property value="mainImage.lien"/>" title="<s:property value="nom" />" /></div>
					
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
							</s:iterator>
	
					</div>
				</div>
			</div>
		</div>
</div>
