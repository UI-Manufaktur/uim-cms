module uim.cms.views.offers.update;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSOffersUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/offers");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleEdit("Offer bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action("/cms/offers/actions/update")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Offers")
          .subTitle("Offers bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersUpdateView~"::DCMSOffersUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Offer ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Offer Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Offers")
            .item(["active", "fw-bold"], ["href":rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-")], "Bearbeiten")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSOffersUpdateView"));