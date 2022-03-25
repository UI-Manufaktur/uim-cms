module uim.cms.controllers.actions.docus.create;

@safe:
import uim.cms;

class DCMSDocuCreateAction : DCMSDocuAction {
  mixin(APPControllerThis!("CMSDocuCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocuCreateAction~":DCMSDocuCreateAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["docus"].createFromTemplate.fromRequest(options);   
    tenant["docus"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSDocuCreateAction"));
