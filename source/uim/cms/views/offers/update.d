module uim.cms.views.offers.update;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSOffersUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Offers")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleEdit("Offer bearbeiten"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/save")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Offers")
          .subTitle("Offers anzeigen");
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersUpdateView~"::DCMSOffersUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Offer ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Offer Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
/*         .headerTitle(headerTitle)
      .bodyTitle(bodyTitle) */
      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSOffersUpdateView"));