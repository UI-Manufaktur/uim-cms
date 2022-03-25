module uim.cms.controllers.actions.create;

@safe:
import uim.cms;

class DCMSCreateAction : DCMSAction {
  mixin(APPControllerThis!("CMSCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSCreateAction~":DCMSCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (auto entity = collection.createFromTemplate) {             
      debug writeln("Created entity:", entity.id);

      entity.fromRequest(options);

      collection.insertOne(entity);
      debug writeln("entity.id = ", entity.id);

      options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
    }
	}
}
mixin(APPControllerCalls!("CMSCreateAction"));
