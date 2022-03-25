module uim.cms.controllers.actions.links.delete_;

@safe:
import uim.cms;

class DCMSLinkDeleteAction : DCMSLinkAction {
  mixin(APPControllerThis!("CMSLinkDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinkDeleteAction~":DCMSLinkDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSLink.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSLinkDeleteAction"));
