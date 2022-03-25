module uim.cms.controllers.pages.themes.create;

@safe:
import uim.cms;

class DCMSThemesCreatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSThemesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .scripts.addContents(
      editorSummary~
      editorText,
`window.addEventListener('load', (event) => {
  document.getElementById("entityForm").addEventListener("submit", event => {
    editorSummary.save();
    editorText.save();
  })
});`);

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesUpdatePageController~":DCMSThemesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_themes"].createFromTemplate;      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/cms/themes");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSThemesCreatePageController"));
