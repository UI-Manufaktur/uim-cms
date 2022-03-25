module uim.cms.controllers.actions.update;

@safe:
import uim.cms;

class DCMSUpdateAction : DCMSAction {
  mixin(APPControllerThis!("CMSUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogUpdateAction~":DCMSUpdateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

    auto appSession = getAppSession(options);
    debug writeln("In DCMSUpdateAction: appSession "~(appSession ? appSession.id : null));
    if (auto tenant = database[appSession.site]) {
      debug writeln("In DCMSUpdateAction: tenant "/* ~tenant.name */);

      if (auto collection = tenant[collectionName]) {
        debug writeln("In DCMSUpdateAction: collection "~collectionName);

        if (auto entityId = options.get("entity_id", null)) {
          debug writeln("found entityId "~entityId);
       
          if (auto entity = collection.findOne(UUID(entityId))) {        
            entity.fromRequest(options);
            collection.updateOne(entity);
            options["redirect"] = rootPath~"/view?id="~entityId;
          }
        }
      }
    }
	}
}
mixin(APPControllerCalls!("CMSUpdateAction"));

version(test_uim_CMS) {
  unittest {
    // TODO
  }
}