module uim.cms.controllers.pages.glossary.update;

@safe:
import uim.cms;

class DCMSGlossaryUpdatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSGlossaryUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryUpdateView(this))
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
    debugMethodCall(moduleName!DCMSGlossaryUpdatePageController~":DCMSGlossaryUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_glossary"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/cms/glossary");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSGlossaryUpdatePageController"));