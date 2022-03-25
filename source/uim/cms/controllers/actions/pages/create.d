module uim.cms.controllers.actions.pages.create;

@safe:
import uim.cms;

class DCMSPageCreateAction : DCMSPageAction {
  mixin(APPControllerThis!("CMSPageCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPageCreateAction~":DCMSPageCreateAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["pages"].createFromTemplate.fromRequest(options);   
    tenant["pages"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSPageCreateAction"));
