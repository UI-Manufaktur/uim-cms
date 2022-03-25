module uim.cms.controllers.pages.offers.delete_;

@safe:
import uim.cms;

class DCMSOffersDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSOffersDeletePageController"));

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
    debugMethodCall(moduleName!DCMSOffersUpdatePageController~":DCMSOffersUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_offers"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/cms/offers");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSOffersDeletePageController"));