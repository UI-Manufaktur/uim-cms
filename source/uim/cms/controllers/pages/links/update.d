module uim.cms.controllers.pages.links.update;

@safe:
import uim.cms;

class DCMSLinksUpdatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSLinksUpdatePageController"));

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
    debugMethodCall(moduleName!DCMSLinksUpdatePageController~":DCMSLinksUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_links"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/cms/links");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSLinksUpdatePageController"));