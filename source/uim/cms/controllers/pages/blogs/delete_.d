module uim.cms.controllers.pages.blogs.delete_;

@safe:
import uim.cms;

class DCMSBlogsDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSBlogsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsUpdatePageController~":DCMSBlogsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_blogs"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/blogs");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSBlogsDeletePageController"));