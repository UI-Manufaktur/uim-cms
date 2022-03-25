module uim.cms.controllers.pages.offers.create;

@safe:
import uim.cms;

class DCMSOffersCreatePageController : DCMSCreatePageController {
  mixin(APPPageControllerThis!("CMSOffersCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .scripts.addContents(
      editorSummary~
      editorText,
`window.addEventListener('load', (event) => {
  document.getElementById("entityForm").addEventListener("submit", event => {
    editorSummary.save();
    editorText.save();
  })
});`);

    this
      .rootPath("/cms/offers") 
      .collectionName("cms_offers"); 
  }
}
mixin(APPPageControllerCalls!("CMSOffersCreatePageController"));
