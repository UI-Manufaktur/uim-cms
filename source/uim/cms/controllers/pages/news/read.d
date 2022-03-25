module uim.cms.controllers.pages.news.read;

@safe:
import uim.cms;

class DCMSNewsReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSNewsReadPageController"));

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
mixin(APPPageControllerCalls!("CMSNewsReadPageController"));