module uim.cms.controllers.pages.links.read;

@safe:
import uim.cms;

class DCMSLinksReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSLinksReadPageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/links") 
      .collectionName("cms_links");     
  }
}
mixin(APPPageControllerCalls!("CMSLinksReadPageController"));