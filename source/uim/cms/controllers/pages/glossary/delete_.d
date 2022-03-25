module uim.cms.controllers.pages.glossary.delete_;

@safe:
import uim.cms;

class DCMSGlossaryDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSGlossaryDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryDeleteView(this))
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryUpdatePageController~":DCMSGlossaryUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_glossary"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/glossary");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSGlossaryDeletePageController"));