<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="row">
	<div class="col-lg-offset-3 col-lg-6 col-sm-offset-3 col-sm-6">
		<section class="content-wrapper main-content clear-fix">
			<form method="post" id="addEval" class="form-horizontal" action="<s:url action='addEval' />">
			
				<s:iterator value="lstCriteresEval" status="idx">

					<label class="col-lg-4 control-label"> <s:property
							value="libcourt" />
					</label>
					<input class="critnumber" type="hidden"
						value='<s:property value="idcriteval" />' />
					<input type="number" id='"<s:property value="libcourt" />" '
						class="rating" min=0 max=5 step=1 data-size="sm" data-rtl="false" />

				</s:iterator>

				<input type="hidden" name="idBar" id="ididBar"
					value='<s:property value="idBar" />' /> <input type="hidden"
					name="idNotes" id="idNotes" /> <input type="hidden"
					name="idCriteres" id="idCriteres" />

				<fieldset>
					<div class="form-group">
						<div class="col-lg-4">
							<div class="row">
								<div class="col-lg-6">
									<br> <br> <label for="idCommentaire"
										class="col-lg-4 control-label">Commentaire</label> <input
										class="form-control" id="idCommentaire" name="commentaire" />
								</div>
								<div class="col-lg-6">&nbsp;</div>
							</div>
						</div>
					</div>
				</fieldset>

				<div class="form-group">
					<div class="col-lg-4 col-lg-offset-2 col-sm-4 col-sm-offset-2">
						<button type="reset" class="btn btn-default btn-center">
							<span class="glyphicon glyphicon-refresh"></span> État initial
						</button>
					</div>
					<div class="col-lg-4">
						<button type="submit" id="test" class="btn btn-primary btn-center">
							<span class="glyphicon glyphicon-ok"></span> Mettre à jour
						</button>
					</div>
				</div>
			</form>
		</section>
	</div>
</div>
