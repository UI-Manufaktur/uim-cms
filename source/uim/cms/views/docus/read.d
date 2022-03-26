module uim.cms.views.docus.read;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSDocusReadView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/docus");

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleView("Docu anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .crudMode(this.crudMode)
        .content(CMSFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Docus")
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
mixin(APPViewCalls!("CMSDocusReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}