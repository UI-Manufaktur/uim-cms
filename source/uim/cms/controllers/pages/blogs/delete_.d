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
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs")    
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );
  }
}
mixin(APPPageControllerCalls!("CMSBlogsDeletePageController"));