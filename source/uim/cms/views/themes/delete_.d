module uim.cms.views.themes.delete_;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSThemesDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/themes");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleDelete("Theme löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
        .mainTitle("Themes")
        .subTitle("Themes löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesDeleteView~"::DCMSThemesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Theme ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Theme Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Themes")
            .item(["active", "fw-bold"], ["href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSThemesDeleteView"));