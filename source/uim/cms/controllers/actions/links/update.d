module uim.cms.controllers.actions.links.update;

@safe:
import uim.cms;

class DCMSLinkUpdateAction : DCMSLinkAction {
  mixin(APPControllerThis!("CMSLinkUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinkUpdateAction~":DCMSLinkUpdateAction("~this.name~")::beforeResponse");
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
mixin(APPControllerCalls!("CMSLinkUpdateAction"));
