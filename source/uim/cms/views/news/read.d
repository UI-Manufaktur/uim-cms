module uim.cms.views.news.read;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSNewsReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/newss");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleView("News anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("News")
          .subTitle("News anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsReadView~"::DCMSNewsReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "News ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "News Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "News")
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
mixin(APPViewCalls!("CMSNewsReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}