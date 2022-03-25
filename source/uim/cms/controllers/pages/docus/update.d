module uim.cms.controllers.pages.docus.update;

@safe:
import uim.cms;

class DCMSDocusUpdatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSDocusUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSDocusUpdateView(this))
      .scripts
        .addContents(
          editorSummary~editorText,
    `window.addEventListener('load', (event) => {
      document.getElementById("entityForm").addEventListener("submit", event => {
        editorSummary.save();
        editorText.save();
      })
    });`);

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusUpdatePageController~":DCMSDocusUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_docus"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/cms/docus");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSDocusUpdatePageController"));