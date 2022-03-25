module uim.cms.views.news.read;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSNewsReadView"));

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
        .title(titleView("News anzeigen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
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
    debugMethodCall(moduleName!DCMSNewsReadView~"::DCMSNewsReadView:beforeH5");
    super.beforeH5(options);

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
mixin(APPViewCalls!("CMSNewsReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}