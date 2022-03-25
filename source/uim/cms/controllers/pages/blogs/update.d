module uim.cms.controllers.pages.blogs.update;

@safe:
import uim.cms;

class DCMSBlogsUpdatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSBlogsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsUpdateView(this))
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
    debugMethodCall(moduleName!DCMSBlogsUpdatePageController~":DCMSBlogsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_blogs"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/cms/blogs");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSBlogsUpdatePageController"));