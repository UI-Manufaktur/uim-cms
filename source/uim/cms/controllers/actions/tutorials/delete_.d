module uim.cms.controllers.actions.tutorials.delete_;

@safe:
import uim.cms;

class DCMSTutorialDeleteAction : DCMSTutorialAction {
  mixin(APPControllerThis!("CMSTutorialDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialDeleteAction~":DCMSTutorialDeleteAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSTutorial.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSTutorialDeleteAction"));
