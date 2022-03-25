module uim.cms.views.links.update;

@safe:
import uim.cms;
import uim.cms.views.links;

class DCMSLinksUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSLinksUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Links")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
      // .rootPath(myRootPath)
      .title(titleEdit("Link bearbeiten"));
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
          .mainTitle("Links")
          .subTitle("Links anzeigen");
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksUpdateView~"::DCMSLinksUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Link ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Link Name:";

    this.form
      //.headerTitle(headerTitle)
      // .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSLinksUpdateView"));