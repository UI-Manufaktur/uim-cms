module uim.cms.controllers.pages.blogs.read;

@safe:
import uim.cms;

class DCMSBlogsReadPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSBlogsReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsReadView(this))
      .scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsReadPageController~":DCMSBlogsReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "cms_blogs"].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Read);
            rootPath("/cms/blogs");
            readonly(true);
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSBlogsReadPageController"));