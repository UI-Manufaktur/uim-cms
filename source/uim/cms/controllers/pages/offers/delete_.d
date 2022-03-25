module uim.cms.controllers.pages.offers.delete_;

@safe:
import uim.cms;

class DCMSOffersDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSOffersDeletePageController"));

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
      .collectionName("cms_offers"); 
  }
}
mixin(APPPageControllerCalls!("CMSOffersDeletePageController"));