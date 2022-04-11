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
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs");   

    if (auto vw = cast(DCMSBlogsUpdateView)this.view) {
      if (auto form = cast(DForm)vw.form) {
        this
          .scripts
            .addContents(
              editorSummary~editorText,
        `window.addEventListener('load', (event) => {
          document.getElementById("`~form.id~`").addEventListener("submit", event => {
            editorSummary.save();
            editorText.save();
          })
        });`);
    }}
  }
}
mixin(APPPageControllerCalls!("CMSBlogsUpdatePageController"));