module uim.cms.controllers.actions.update;

@safe:
import uim.cms;

class DCMSUpdateAction : DCMSAction {
  mixin(APPControllerThis!("CMSUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSUpdateAction~":DCMSUpdateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     
  
    if (auto entityId = options.get("entity_id", null)) {
      auto entity = collection.findOne(UUID(entityId));
      
      entity.fromRequest(options);
      foreach(name, attribute; entity.attributes) { // Workaround :-O
        if (auto booleanAttribute = cast(DOOPBooleanAttribute)attribute) {
          if ("entity_"~name !in options) booleanAttribute.value(false);  
        }
      }

      database[appSession.site, collectionName].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("CMSUpdateAction"));

version(test_uim_CMS) {
  unittest {
    // TODO
  }
}