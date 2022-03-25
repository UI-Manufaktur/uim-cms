module uim.cms.views.tutorials.create;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSTutorialsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Tutorials")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        // .rootPath(myRootPath)
        .title(titleCreate("Tutorial erstellen"));
    }
    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/create")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent
          .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 

    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Neuer Tutorial")
          .subTitle("Bitte Werte eingeben");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsCreateView~"::DCMSTutorialsCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";
 */

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["tutorials"].createFromTemplate);
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
mixin(APPViewCalls!("CMSTutorialsCreateView"));
