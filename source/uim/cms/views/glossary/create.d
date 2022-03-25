module uim.cms.views.glossary.create;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSGlossaryCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Glossary")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleCreate("Glossareintrag erstellen"));
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
          .mainTitle("Neuer Glossareintrag")
          .subTitle("Bitte Werte eingeben");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryCreateView~"::DCMSGlossaryCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:";
 */

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["glossary"].createFromTemplate);
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
mixin(APPViewCalls!("CMSGlossaryCreateView"));
