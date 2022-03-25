module uim.cms.controllers.pages.blogs.delete_;

@safe:
import uim.cms;

class DCMSBlogsDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSBlogsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );
    this
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs");    
  }
}
mixin(APPPageControllerCalls!("CMSBlogsDeletePageController"));