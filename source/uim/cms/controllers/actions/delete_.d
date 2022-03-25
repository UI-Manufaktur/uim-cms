module uim.cms.controllers.actions.delete_;

@safe:
import uim.cms;

class DCMSDeleteAction : DCMSAction {
  mixin(APPControllerThis!("CMSDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDeleteAction~":DCMSDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (auto entity = collection.createFromTemplate) {             
      debug writeln("Created entity:", entity.id);

      entity.fromRequest(options);
      database[appSession.site, collectionName].removeOne(entity);

      options["redirect"] = rootPath;
    }
	}
}
mixin(APPControllerCalls!("CMSDeleteAction"));

version(test_uim_CMS) {
  unittest {
    // TODO
  }
}