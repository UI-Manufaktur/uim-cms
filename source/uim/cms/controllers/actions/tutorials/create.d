module uim.cms.controllers.actions.tutorials.create;

@safe:
import uim.cms;

class DCMSTutorialCreateAction : DCMSTutorialAction {
  mixin(APPControllerThis!("CMSTutorialCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialCreateAction~":DCMSTutorialCreateAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["tutorials"].createFromTemplate.fromRequest(options);   
    tenant["tutorials"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSTutorialCreateAction"));
