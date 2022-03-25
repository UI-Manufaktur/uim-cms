module uim.cms.views.offers.create;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSOffersCreateView"));

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
        // .rootPath(myRootPath)
        .title(titleCreate("Link erstellen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/create")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent
          .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Neuer Link")
          .subTitle("Bitte Werte eingeben");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersCreateView~"::DCMSOffersCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Offer ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Offer Name:";
 */

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["offers"].createFromTemplate);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/create")
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSOffersCreateView"));
