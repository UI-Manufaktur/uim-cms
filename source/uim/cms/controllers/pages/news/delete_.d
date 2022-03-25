module uim.cms.controllers.pages.news.delete_;

@safe:
import uim.cms;

class DCMSNewsDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSNewsDeletePageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsUpdatePageController~":DCMSNewsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_news"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/news");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSNewsDeletePageController"));