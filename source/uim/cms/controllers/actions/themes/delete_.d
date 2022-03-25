module uim.cms.controllers.actions.themes.delete_;

@safe:
import uim.cms;

class DCMSThemeDeleteAction : DCMSThemeAction {
  mixin(APPControllerThis!("CMSThemeDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemeDeleteAction~":DCMSThemeDeleteAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSTheme.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSThemeDeleteAction"));
