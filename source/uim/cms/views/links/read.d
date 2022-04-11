module uim.cms.views.links.read;

@safe:
import uim.cms;
import uim.cms.views.links;

class DCMSLinksReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSLinksReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/links");

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleView("Link anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      frm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        frmHeader
          .mainTitle("Links")
          .subTitle("Links anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksReadView~"::DCMSLinksReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Link ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Link Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Links")
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
mixin(APPViewCalls!("CMSLinksReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}