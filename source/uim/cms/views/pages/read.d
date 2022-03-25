module uim.cms.views.pages.read;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSPagesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Seiten")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleView("Seite anzeigen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Seiten")
          .subTitle("Seite anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesReadView~"::DCMSPagesReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Page ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Page Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
/*         .headerTitle(headerTitle)
      .bodyTitle(bodyTitle) */
      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSPagesReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}