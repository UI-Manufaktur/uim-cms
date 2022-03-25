module uim.cms.views.tutorials.read;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSTutorialsReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Tutorials")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleView("Tutorial anzeigen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Tutorials")
          .subTitle("Tutorial anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsReadView~"::DCMSTutorialsReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
/*       .headerTitle(headerTitle)
    .bodyTitle(bodyTitle) */
      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSTutorialsReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}