module uim.cms.controllers.pages.themes.delete_;

@safe:
import uim.cms;

class DCMSThemesDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSThemesDeletePageController"));

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
    debugMethodCall(moduleName!DCMSThemesUpdatePageController~":DCMSThemesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_themes"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/themes");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSThemesDeletePageController"));