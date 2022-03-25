module uim.cms.controllers.actions.links.create;

@safe:
import uim.cms;

class DCMSLinkCreateAction : DCMSLinkAction {
  mixin(APPControllerThis!("CMSLinkCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinkCreateAction~":DCMSLinkCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["links"].createFromTemplate.fromRequest(options);   
    tenant["links"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSLinkCreateAction"));
