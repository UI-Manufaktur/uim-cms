module uim.cms.views.offers.delete_;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSOffersDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/offers");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleDelete("Offer löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
        .mainTitle("Offers")
        .subTitle("Offers löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersDeleteView~"::DCMSOffersDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Offer ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Offer Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Offers")
            .item(["active", "fw-bold"], ["href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSOffersDeleteView"));