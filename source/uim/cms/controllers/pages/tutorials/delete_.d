module uim.cms.controllers.pages.tutorials.delete_;

@safe:
import uim.cms;

class DCMSTutorialsDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSTutorialsDeletePageController"));

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
    debugMethodCall(moduleName!DCMSTutorialsUpdatePageController~":DCMSTutorialsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_tutorials"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/tutorials");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSTutorialsDeletePageController"));