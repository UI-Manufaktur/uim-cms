module uim.cms.controllers.pages.glossary.read;

@safe:
import uim.cms;

class DCMSGlossaryReadPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSGlossaryReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryReadView(this))
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryReadPageController~":DCMSGlossaryReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_glossary"].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Read);
            rootPath("/cms/glossary");
            readonly(true);
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSGlossaryReadPageController"));