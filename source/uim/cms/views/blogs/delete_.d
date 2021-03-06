module uim.cms.views.blogs.delete_;

@safe:
import uim.cms;
import uim.cms.views.blogs;

class DCMSBlogsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSBlogsDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/blogs");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleDelete("Blog löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
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

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Blogs")
            .item(["active", "fw-bold"], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSBlogsDeleteView"));