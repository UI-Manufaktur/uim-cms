module uim.cms.views.offers.read;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSOffersReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/offers");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleView("Offer anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Offers")
          .subTitle("Offers anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersReadView~"::DCMSOffersReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

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
            .item(["active", "fw-bold"], ["href":rootPath~"/view?id="~(this.entity ? this.entity["id"] : " -missing-")], "Anzeigen")
          )          
        );
    }

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSOffersReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}