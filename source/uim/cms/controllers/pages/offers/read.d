module uim.cms.controllers.pages.offers.read;

@safe:
import uim.cms;

class DCMSOffersReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSOffersReadPageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/offers") 
      .collectionName("cms_offers");   }
}
mixin(APPPageControllerCalls!("CMSOffersReadPageController"));