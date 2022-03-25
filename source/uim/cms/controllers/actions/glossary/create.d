module uim.cms.controllers.actions.glossary.create;

@safe:
import uim.cms;

class DCMSGlossaryCreateAction : DCMSGlossaryAction {
  mixin(APPControllerThis!("CMSGlossaryCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryCreateAction~":DCMSGlossaryCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    
    auto tenant = database[appSession.site];
    auto entity = tenant["glossary"].createFromTemplate.fromRequest(options);   
    tenant["glossary"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSGlossaryCreateAction"));
