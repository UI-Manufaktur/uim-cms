module uim.cms.controllers.pages.docus.delete_;

@safe:
import uim.cms;

class DCMSDocusDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSDocusDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSDocusDeleteView(this))
      .scripts.addContents(
        editorSummary~editorText~
        "editorSummary.disabled();"~
        "editorText.disabled();"
      );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusUpdatePageController~":DCMSDocusUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_docus"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/docus");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSDocusDeletePageController"));