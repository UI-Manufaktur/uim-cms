module uim.cms.controllers.actions.docus.delete_;

@safe:
import uim.cms;

class DCMSDocuDeleteAction : DCMSDocuAction {
  mixin(APPControllerThis!("CMSDocuDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocuDeleteAction~":DCMSDocuDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSDocu.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSDocuDeleteAction"));
