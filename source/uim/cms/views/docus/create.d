module uim.cms.views.docus.create;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSDocusCreateView"));

  override void initialize() {
    super.initialize;
    
    this.rootPath("/cms/docus");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Docus")
      .link(["active"], ["href":this.rootPath~"/create", "aria-current":"page"], "Create")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .title(titleCreate("Docu erstellen"))
        .rootPath(this.rootPath);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .content(CMSDocuFormContent); 
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Neuer Docu")
          .subTitle("Bitte Werte eingeben");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusCreateView~"::DCMSDocusCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Docu ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Docu Name:";
 */

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["cms_docus"].createFromTemplate);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/docus/actions/create")
        //.headerTitle(headerTitle)
        //.bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSDocusCreateView"));
