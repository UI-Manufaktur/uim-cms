module uim.cms.views.docus.delete_;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSDocusDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/blogs");

    if (auto header = cast(DPageHeader)this.header) {
      header
        .title(titleDelete("Blog löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent)
        .rootPath(this.rootPath);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
        .mainTitle("Blogs")
        .subTitle("Blogs löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsDeleteView~"::DCMSBlogsDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Blogs")
            .link(["active":"active", "href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSDocusDeleteView"));