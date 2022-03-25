module uim.cms.controllers.pages.news.update;

@safe:
import uim.cms;

class DCMSNewsUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSNewsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .scripts.addContents(
        editorSummary~editorText,
`window.addEventListener('load', (event) => {
  document.getElementById("entityForm").addEventListener("submit", event => {
    editorSummary.save();
    editorText.save();
  })
});`);

    this
      .rootPath("/cms/news") 
      .collectionName("cms_news"); 
  }
}
mixin(APPPageControllerCalls!("CMSNewsUpdatePageController"));