module uim.cms.controllers.actions.pages.delete_;

@safe:
import uim.cms;

class DCMSPageDeleteAction : DCMSPageAction {
  mixin(APPControllerThis!("CMSPageDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPageDeleteAction~":DCMSPageDeleteAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSPage.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSPageDeleteAction"));
