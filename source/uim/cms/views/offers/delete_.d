module uim.cms.views.offers.delete_;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSOffersDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/offers");

    if (auto header = cast(DPageHeader)this.header) {
      header
        .title(titleDelete("Offer löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent)
        .rootPath(this.rootPath);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Offers")
            .link(["active":"active", "href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSOffersDeleteView"));