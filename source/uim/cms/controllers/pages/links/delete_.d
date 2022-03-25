module uim.cms.controllers.pages.links.delete_;

@safe:
import uim.cms;

class DCMSLinksDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSLinksDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsDeleteView(this))    
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksUpdatePageController~":DCMSLinksUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_links"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/links");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSLinksDeletePageController"));