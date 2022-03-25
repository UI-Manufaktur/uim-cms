module uim.cms.controllers.pages.blogs.update;

@safe:
import uim.cms;

class DCMSBlogsUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSBlogsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsUpdateView(this))
      .scripts
        .addContents(
          editorSummary~editorText,
    `window.addEventListener('load', (event) => {
      document.getElementById("entityForm").addEventListener("submit", event => {
        editorSummary.save();
        editorText.save();
      })
    });`);

    this
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs");   
  }
}
mixin(APPPageControllerCalls!("CMSBlogsUpdatePageController"));