module uim.cms.controllers.pages.links.create;

@safe:
import uim.cms;

class DCMSLinksCreatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSLinksCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsCreateView(this))    
      .scripts.addContents(
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

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "cms_links"].createFromTemplate;      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/cms/links");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSLinksCreatePageController"));
