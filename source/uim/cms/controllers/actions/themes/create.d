module uim.cms.controllers.actions.themes.create;

@safe:
import uim.cms;

class DCMSThemeCreateAction : DCMSThemeAction {
  mixin(APPControllerThis!("CMSThemeCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemeCreateAction~":DCMSThemeCreateAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["themes"].createFromTemplate.fromRequest(options);   
    tenant["themes"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSThemeCreateAction"));
