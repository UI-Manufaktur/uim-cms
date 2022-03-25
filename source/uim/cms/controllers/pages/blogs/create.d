module uim.cms.controllers.pages.blogs.create;

@safe:
import uim.cms;

class DCMSBlogsCreatePageController : DCMSCreatePageController {
  mixin(APPPageControllerThis!("CMSBlogsCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsCreateView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText,
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
mixin(APPPageControllerCalls!("CMSBlogsCreatePageController"));
