module uim.cms.controllers.actions.offers.create;

@safe:
import uim.cms;

class DCMSOfferCreateAction : DCMSOfferAction {
  mixin(APPControllerThis!("CMSOfferCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOfferCreateAction~":DCMSOfferCreateAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["offers"].createFromTemplate.fromRequest(options);   
    tenant["offers"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSOfferCreateAction"));
