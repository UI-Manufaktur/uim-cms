module uim.cms.controllers.pages.tutorials.update;

@safe:
import uim.cms;

class DCMSTutorialsUpdatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSTutorialsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~editorText,
`window.addEventListener('load', (event) => {
  document.getElementById("entityForm").addEventListener("submit", event => {
    editorSummary.save();
    editorText.save();
  })
});`);

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsUpdatePageController~":DCMSTutorialsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_tutorials"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/cms/tutorials");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSTutorialsUpdatePageController"));