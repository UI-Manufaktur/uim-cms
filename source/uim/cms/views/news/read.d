module uim.cms.views.news.read;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSNewsReadView"));

override void initialize() {
    super.initialize;

    this.rootPath("/cms/newss");

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleView("News anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "News")
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
mixin(APPViewCalls!("CMSNewsReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}