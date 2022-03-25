module uim.cms.controllers.pages.pages.update;

@safe:
import uim.cms;

class DCMSPagesUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSPagesUpdatePageController"));

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
      .rootPath("/cms/pages") 
      .collectionName("cms_pages"); 
  }
}
mixin(APPPageControllerCalls!("CMSPagesUpdatePageController"));