module uim.cms.views.glossary.update;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSGlossaryUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Glossar")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
      // .rootPath(myRootPath)
      .title(titleEdit("Glossareintrag bearbeiten"));
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
          .mainTitle("Glossar")
          .subTitle("Glossary anzeigen");
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryUpdateView~"::DCMSGlossaryUpdateView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
        //.headerTitle(headerTitle)
        //.bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSGlossaryUpdateView"));