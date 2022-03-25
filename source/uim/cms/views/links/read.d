module uim.cms.views.links.read;

@safe:
import uim.cms;
import uim.cms.views.links;

class DCMSLinksReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSLinksReadView"));

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
        .rootPath(myRootPath)
        .title(titleView("Link anzeigen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Link")
          .subTitle("Link anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksReadView~"::DCMSLinksReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Link ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Link Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
        //.headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSLinksReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}