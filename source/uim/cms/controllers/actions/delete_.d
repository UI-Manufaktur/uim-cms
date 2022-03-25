module uim.cms.controllers.actions.delete_;

@safe:
import uim.cms;

class DCMSDeleteAction : DCMSAction {
  mixin(APPControllerThis!("CMSDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogDeleteAction~":DCMSDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);
    debug writeln("In DCMSDeleteAction: appSession "~(appSession ? appSession.id : null));
    if (auto tenant = database[appSession.site]) {
      debug writeln("In DCMSDeleteAction: tenant "/* ~tenant.name */);

      if (auto collection = tenant[collectionName]) {
        debug writeln("In DCMSDeleteAction: collection "~collectionName);

        auto entity = collection.createFromTemplate.fromRequest(options);   
        debug writeln("In DCMSDeleteAction: entity "~entity.name);

        collection.removeOne(entity);

        options["redirect"] = rootPath;
      }  
    }
	}
}
mixin(APPControllerCalls!("CMSDeleteAction"));

version(test_uim_CMS) {
  unittest {
    // TODO
  }
}