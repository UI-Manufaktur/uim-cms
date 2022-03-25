module uim.cms.controllers.actions.news.create;

@safe:
import uim.cms;

class DCMSNewsCreateAction : DCMSNewsAction {
  mixin(APPControllerThis!("CMSNewsCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsCreateAction~":DCMSNewsCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["news"].createFromTemplate.fromRequest(options);   
    tenant["news"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSNewsCreateAction"));
