module uim.cms.controllers.actions.offers.update;

@safe:
import uim.cms;

class DCMSOfferUpdateAction : DCMSUpdateAction {
  mixin(APPControllerThis!("CMSOfferUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/offers") 
    .collectionName("cms_offers"); 
  }
}
mixin(APPControllerCalls!("CMSOfferUpdateAction"));
