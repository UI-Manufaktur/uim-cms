module uim.cms.controllers.pages.pages.delete_;

@safe:
import uim.cms;

class DCMSPagesDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSPagesDeletePageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/pages") 
      .collectionName("cms_pages"); 
  }
}
mixin(APPPageControllerCalls!("CMSPagesDeletePageController"));