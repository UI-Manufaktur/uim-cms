module uim.cms.views.pages.read;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSPagesReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/pages");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleView("Page anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Pages")
          .subTitle("Pages anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesReadView~"::DCMSPagesReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Page ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Page Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Pages")
            .item(["active", "fw-bold"], ["href":rootPath~"/view?id="~(this.entity ? this.entity["id"] : " -missing-")], "Anzeigen")
          )          
        );
    }

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSPagesReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}