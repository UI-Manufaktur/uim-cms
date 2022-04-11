module uim.cms.views.docus.read;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSDocusReadView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/docus");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleView("Docu anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath)
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Docus")
            .item(["active", "fw-bold"], "Anzeigen")
          )          
        );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Docus")
          .subTitle("Docus anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusReadView~"::DCMSDocusReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
    
    auto headerTitle = "Docu ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Docu Name:";

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSDocusReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}