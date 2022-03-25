module uim.cms.views.blogs.delete_;

@safe:
import uim.cms;
import uim.cms.views.blogs;

class DCMSBlogsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSBlogsDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Blogs")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleDelete("Blog löschen"));
    }
    
     if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/blogs/actions/delete")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
        .rootPath(myRootPath)
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

/*     if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/blogs/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("CMSBlogsDeleteView"));