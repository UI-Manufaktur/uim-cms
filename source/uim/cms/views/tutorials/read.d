module uim.cms.views.tutorials.read;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSTutorialsReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/tutorials");

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleView("Tutorial anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      frm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        frmHeader
          .mainTitle("Tutorials")
          .subTitle("Tutorials anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsReadView~"::DCMSTutorialsReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Tutorials")
            .link(["active":"active", "href":rootPath~"/view?id="~(this.entity ? this.entity["id"] : " -missing-")], "Anzeigen")
          )          
        );
    }

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSTutorialsReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}