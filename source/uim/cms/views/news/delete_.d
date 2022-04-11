module uim.cms.views.news.delete_;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSNewsDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/news");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleDelete("News löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
        .mainTitle("News")
        .subTitle("News löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsDeleteView~"::DCMSNewsDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "News ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "News Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "News")
            .item(["active", "fw-bold"], ["href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSNewsDeleteView"));