module uim.cms.controllers.actions.offers.delete_;

@safe:
import uim.cms;

class DCMSOfferDeleteAction : DCMSOfferAction {
  mixin(APPControllerThis!("CMSOfferDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOfferDeleteAction~":DCMSOfferDeleteAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSOffer.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSOfferDeleteAction"));
