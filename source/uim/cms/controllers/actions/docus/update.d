module uim.cms.controllers.actions.docus.update;

@safe:
import uim.cms;

class DCMSDocuUpdateAction : DCMSDocuAction {
  mixin(APPControllerThis!("CMSDocuUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocuUpdateAction~":DCMSDocuUpdateAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

    auto appSession = getAppSession(options);

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site, "docus"].findOne(UUID(entityId));
      
      entity.fromRequest(options);

      database[appSession.site, "docus"].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("CMSDocuUpdateAction"));
