module uim.cms.controllers.pages.links.update;

@safe:
import uim.cms;

class DCMSLinksUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSLinksUpdatePageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
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
mixin(APPPageControllerCalls!("CMSLinksUpdatePageController"));