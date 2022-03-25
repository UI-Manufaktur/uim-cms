module uim.cms.controllers.actions.create;

@safe:
import uim.cms;

class DCMSCreateAction : DCMSAction {
  mixin(APPControllerThis!("CMSCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSCreateAction~":DCMSCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (auto appSession = getAppSession(options)) {
      debug writeln("In DCMSCreateAction: appSession "~(appSession ? appSession.id : null));
      if (auto tenant = database[appSession.site]) {
        debug writeln("In DCMSCreateAction: tenant "/* ~tenant.name */);

        if (auto collection = tenant[collectionName]) {
          debug writeln("In DCMSCreateAction: collection "~collectionName);

          if (auto entity = collection.createFromTemplate.fromRequest(options)) {   
            debug writeln("In DCMSCreateAction: entity "~entity.name);

            collection.insertOne(entity);
            debug writeln("entity.id = ", entity.id);
            options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
          }  
        }
      }
    }
	}
}
mixin(APPControllerCalls!("CMSCreateAction"));
