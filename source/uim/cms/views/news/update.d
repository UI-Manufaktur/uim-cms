module uim.cms.views.news.update;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSNewsUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/news");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleEdit("News bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action("/cms/news/actions/save")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("News")
          .subTitle("News bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsUpdateView~"::DCMSNewsUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

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
            .item(["active", "fw-bold"], ["href":rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-")], "Bearbeiten")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSNewsUpdateView"));