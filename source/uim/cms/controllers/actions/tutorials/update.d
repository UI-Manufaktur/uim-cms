module uim.cms.controllers.actions.tutorials.update;

@safe:
import uim.cms;

class DCMSTutorialUpdateAction : DCMSTutorialAction {
  mixin(APPControllerThis!("CMSTutorialUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialUpdateAction~":DCMSTutorialUpdateAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

    auto appSession = getAppSession(options);

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site, collectionName].findOne(UUID(entityId));
      
      entity.fromRequest(options);

      database[appSession.site, collectionName].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("CMSTutorialUpdateAction"));
