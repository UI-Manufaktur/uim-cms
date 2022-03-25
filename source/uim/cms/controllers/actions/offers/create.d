module uim.cms.controllers.actions.offers.create;

@safe:
import uim.cms;

class DCMSOfferCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSOfferCreateAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/offers") 
      .collectionName("cms_offers"); 
  }
}
mixin(APPControllerCalls!("CMSOfferCreateAction"));
