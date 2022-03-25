module uim.cms.controllers.actions.offers.delete_;

@safe:
import uim.cms;

class DCMSOfferDeleteAction : DCMSDeleteAction {
  mixin(APPControllerThis!("CMSOfferDeleteAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/offers") 
    .collectionName("cms_offers"); 
  }
}
mixin(APPControllerCalls!("CMSOfferDeleteAction"));
