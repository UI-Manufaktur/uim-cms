module uim.cms.views.themes.delete_;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSThemesDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/themes");

    if (auto header = cast(DPageHeader)this.header) {
      header
        .title(titleDelete("Theme löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent)
        .rootPath(this.rootPath);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Themes")
            .link(["active":"active", "href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSThemesDeleteView"));