module uim.cms.views.docus.create;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSDocusCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Docus")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleCreate("Docu erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
      .action("/cms/docus/actions/create")
      .rootPath(myRootPath)
      .content(
        CMSPostFormContent(frm)
        .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
    
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
      this.entity(this.controller.database["uim"]["docus"].createFromTemplate);
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
