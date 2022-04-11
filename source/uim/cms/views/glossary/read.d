module uim.cms.views.glossary.read;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSGlossaryReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/glossary");

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleView("Glossary anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .mainTitle("Glossary")
          .subTitle("Glossary anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryReadView~"::DCMSGlossaryReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:";

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Glossary")
            .link(["active":"active", "href":rootPath~"/view?id="~(this.entity ? this.entity["id"] : " -missing-")], "Anzeigen")
          )          
        );
    }

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSGlossaryReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}