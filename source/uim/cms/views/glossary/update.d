module uim.cms.views.glossary.update;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSGlossaryUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/glossarys");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleEdit("Glossary bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action("/cms/glossarys/actions/save")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Glossary")
          .subTitle("Glossary bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryUpdateView~"::DCMSGlossaryUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Glossarys")
            .item(["active", "fw-bold"], ["href":rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-")], "Bearbeiten")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSGlossaryUpdateView"));