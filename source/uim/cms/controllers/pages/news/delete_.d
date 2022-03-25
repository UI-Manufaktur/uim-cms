module uim.cms.controllers.pages.news.delete_;

@safe:
import uim.cms;

class DCMSNewsDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSNewsDeletePageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/news") 
      .collectionName("cms_news"); 
  }
}
mixin(APPPageControllerCalls!("CMSNewsDeletePageController"));