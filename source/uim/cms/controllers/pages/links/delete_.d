module uim.cms.controllers.pages.links.delete_;

@safe:
import uim.cms;

class DCMSLinksDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSLinksDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsDeleteView(this))    
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

    this
      .rootPath("/cms/links") 
      .collectionName("cms_links"); 
  }
}
mixin(APPPageControllerCalls!("CMSLinksDeletePageController"));