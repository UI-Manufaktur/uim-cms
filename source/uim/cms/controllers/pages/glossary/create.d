module uim.cms.controllers.pages.glossary.create;

@safe:
import uim.cms;

class DCMSGlossaryCreatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSGlossaryCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryCreateView(this))
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

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_glossary"].createFromTemplate;      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/cms/glossary");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSGlossaryCreatePageController"));
