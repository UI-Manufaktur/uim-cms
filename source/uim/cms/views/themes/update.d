module uim.cms.views.themes.update;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSThemesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Themes")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
      // .rootPath(myRootPath)
      .title(titleEdit("Theme bearbeiten"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/save")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Themes")
          .subTitle("Themes anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesUpdateView~"::DCMSThemesUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
/* 
    auto headerTitle = "Theme ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Theme Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
/*         .headerTitle(headerTitle)
        .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSThemesUpdateView"));