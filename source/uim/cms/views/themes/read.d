module uim.cms.views.themes.read;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSThemesReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/themes");

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleView("Theme anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      frm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        frmHeader
          .mainTitle("Themes")
          .subTitle("Themes anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesReadView~"::DCMSThemesReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Theme ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Theme Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Themes")
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
mixin(APPViewCalls!("CMSThemesReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}