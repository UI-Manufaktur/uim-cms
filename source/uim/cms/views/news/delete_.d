module uim.cms.views.news.delete_;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSNewsDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/news");

    if (auto header = cast(DPageHeader)this.header) {
      header
        .title(titleDelete("News löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent)
        .rootPath(this.rootPath);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "News")
            .link(["active":"active", "href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSNewsDeleteView"));