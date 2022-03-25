module uim.cms.controllers.pages.tutorials.read;

@safe:
import uim.cms;

class DCMSTutorialsReadPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSTutorialsReadPageController"));

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
    debugMethodCall(moduleName!DCMSTutorialsReadPageController~":DCMSTutorialsReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_tutorials"].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Read);
            rootPath("/cms/tutorials");
            readonly(true);
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSTutorialsReadPageController"));