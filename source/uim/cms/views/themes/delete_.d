module uim.cms.views.themes.delete_;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSThemesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Themes")
    );

if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
      // .rootPath(myRootPath)
      .title(titleDelete("Theme löschen"));
}
    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/delete")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto header = cast(DPageHeader)this.header) {
        header
          .rootPath(myRootPath)
          .mainTitle("Themes")
          .subTitle("Themes löschen");
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesDeleteView~"::DCMSThemesDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     auto headerTitle = "Theme ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Theme Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/delete?entity_id="~(entity ? entity.id.toString : null))
/*         .headerTitle(headerTitle)
        .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSThemesDeleteView"));