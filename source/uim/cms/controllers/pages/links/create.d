module uim.cms.controllers.pages.links.create;

@safe:
import uim.cms;

class DCMSLinksCreatePageController : DCMSCreatePageController {
  mixin(APPPageControllerThis!("CMSLinksCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSBlogsCreateView(this))    
      .scripts.addContents(
        editorSummary~editorText,
        `window.addEventListener('load', (event) => {
          document.getElementById("entityForm").addEventListener("submit", event => {
            editorSummary.save();
            editorText.save();
          })
        });`);

    this
      .rootPath("/cms/links") 
      .collectionName("cms_links");         
  }
}
mixin(APPPageControllerCalls!("CMSLinksCreatePageController"));
