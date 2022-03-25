module uim.cms.controllers.actions.news.delete_;

@safe:
import uim.cms;

class DCMSNewsDeleteAction : DCMSNewsAction {
  mixin(APPControllerThis!("CMSNewsDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsDeleteAction~":DCMSNewsDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSNewsItem.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSNewsDeleteAction"));
