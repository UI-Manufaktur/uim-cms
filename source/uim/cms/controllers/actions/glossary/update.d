module uim.cms.controllers.actions.glossary.update;

@safe:
import uim.cms;

class DCMSGlossaryUpdateAction : DCMSGlossaryAction {
  mixin(APPControllerThis!("CMSGlossaryUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryUpdateAction~":DCMSGlossaryUpdateAction("~this.name~")::beforeResponse");
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
mixin(APPControllerCalls!("CMSGlossaryUpdateAction"));
