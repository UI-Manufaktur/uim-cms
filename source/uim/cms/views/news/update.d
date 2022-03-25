module uim.cms.views.news.update;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSNewsUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "News")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleEdit("News bearbeiten"));
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
          .mainTitle("News")
          .subTitle("News anzeigen");
      }
    } 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsUpdateView~"::DCMSNewsUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     auto headerTitle = "News ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "News Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
/*         .headerTitle(headerTitle)
        .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSNewsUpdateView"));