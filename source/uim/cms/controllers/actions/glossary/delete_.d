module uim.cms.controllers.actions.glossary.delete_;

@safe:
import uim.cms;

class DCMSGlossaryDeleteAction : DCMSGlossaryAction {
  mixin(APPControllerThis!("CMSGlossaryDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryDeleteAction~":DCMSGlossaryDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSGlossaryItem.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSGlossaryDeleteAction"));
