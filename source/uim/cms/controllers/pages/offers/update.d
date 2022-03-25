module uim.cms.controllers.pages.offers.update;

@safe:
import uim.cms;

class DCMSOffersUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSOffersUpdatePageController"));

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
      .rootPath("/cms/offers") 
      .collectionName("cms_offers"); 
  }
}
mixin(APPPageControllerCalls!("CMSOffersUpdatePageController"));