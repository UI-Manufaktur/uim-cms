module uim.cms.views.glossary.delete_;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSGlossaryDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/glossary");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleDelete("Glossary löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
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

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
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