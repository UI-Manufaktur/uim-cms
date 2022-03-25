module uim.cms.controllers.pages.docus.create;

@safe:
import uim.cms;

class DCMSDocusCreatePageController : DCMSCreatePageController {
  mixin(APPPageControllerThis!("CMSDocusCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      CMSDocusCreateView(this))
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
    .rootPath("/cms/docus") 
    .collectionName("cms_docus"); 
  }
}
mixin(APPPageControllerCalls!("CMSDocusCreatePageController"));
