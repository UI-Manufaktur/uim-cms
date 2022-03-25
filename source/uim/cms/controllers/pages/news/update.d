module uim.cms.controllers.pages.news.update;

@safe:
import uim.cms;

class DCMSNewsUpdatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSNewsUpdatePageController"));

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
    debugMethodCall(moduleName!DCMSNewsUpdatePageController~":DCMSNewsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_news"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/cms/news");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSNewsUpdatePageController"));