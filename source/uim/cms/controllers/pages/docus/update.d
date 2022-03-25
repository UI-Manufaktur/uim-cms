module uim.cms.controllers.pages.docus.update;

@safe:
import uim.cms;

class DCMSDocusUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSDocusUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSDocusUpdateView(this))
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
      .rootPath("/cms/docus") 
      .collectionName("cms_docus"); 
  }
}
mixin(APPPageControllerCalls!("CMSDocusUpdatePageController"));