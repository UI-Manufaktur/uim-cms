module uim.cms.views.glossary.delete_;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSGlossaryDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/glossary");

    if (auto header = cast(DPageHeader)this.header) {
      header
        .title(titleDelete("Glossary löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent)
        .rootPath(this.rootPath);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
        .mainTitle("Glossary")
        .subTitle("Glossary löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryDeleteView~"::DCMSGlossaryDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:";

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Glossary")
            .link(["active":"active", "href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSGlossaryDeleteView"));