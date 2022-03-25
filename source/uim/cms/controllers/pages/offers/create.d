module uim.cms.controllers.pages.offers.create;

@safe:
import uim.cms;

class DCMSOffersCreatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSOffersCreatePageController"));

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
    debugMethodCall(moduleName!DCMSOffersUpdatePageController~":DCMSOffersUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_offers"].createFromTemplate;      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/cms/offers");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSOffersCreatePageController"));
