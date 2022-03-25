module uim.cms.views.docus.read;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSDocusReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Docus")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
      // .rootPath(myRootPath)
      .title(titleView("Docu anzeigen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Docus")
          .subTitle("Docus anzeigen");
      }   
    }   
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusReadView~"::DCMSDocusReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Docu ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Docu Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSDocusReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}