module uim.cms.views.offers.read;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSOffersReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Offers")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleView("Angebot anzeigen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
      .rootPath(myRootPath)
      .content(
        CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Angebote")
          .subTitle("Angebot anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersReadView~"::DCMSOffersReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     auto headerTitle = "Offer ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Offer Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
/*         .headerTitle(headerTitle)
      .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSOffersReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}