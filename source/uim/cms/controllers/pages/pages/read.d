module uim.cms.controllers.pages.pages.read;

@safe:
import uim.cms;

class DCMSPagesReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSPagesReadPageController"));

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
mixin(APPPageControllerCalls!("CMSPagesReadPageController"));