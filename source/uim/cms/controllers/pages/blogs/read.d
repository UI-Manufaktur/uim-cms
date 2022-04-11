module uim.cms.controllers.pages.blogs.read;

@safe:
import uim.cms;

class DCMSBlogsReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSBlogsReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsReadView(this))
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs")    
      .scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );
  }
}
mixin(APPPageControllerCalls!("CMSBlogsReadPageController"));