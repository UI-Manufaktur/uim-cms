module uim.cms.views.themes.create;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSThemesCreateView"));

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
        .rootPath(myRootPath)
        .title(titleCreate("Theme erstellen")); 
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/create")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent
            .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "text"]));
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Neuer Theme")
          .subTitle("Bitte Werte eingeben");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesCreateView~"::DCMSThemesCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Theme ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Theme Name:";
 */

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["themes"].createFromTemplate);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/create")
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSThemesCreateView"));
