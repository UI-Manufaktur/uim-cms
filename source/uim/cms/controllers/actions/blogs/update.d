module uim.cms.controllers.actions.blogs.update;

@safe:
import uim.cms;

class DCMSBlogUpdateAction : DCMSBlogAction {
  mixin(APPControllerThis!("CMSBlogUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogUpdateAction~":DCMSBlogUpdateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

    auto appSession = getAppSession(options);

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site, "blogs"].findOne(UUID(entityId));
      
      entity.fromRequest(options);

      database[appSession.site, "blogs"].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
	}
}
mixin(APPControllerCalls!("CMSBlogUpdateAction"));
