module uim.cms.views.blogs.update;

@safe:
import uim.cms;
import uim.cms.views.blogs;

class DCMSBlogsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSBlogsUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/blogs");

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleEdit("Blog bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/blogs/actions/save")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .mainTitle("Blogs")
          .subTitle("Blogs bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsUpdateView~"::DCMSBlogsUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Blogs")
            .link(["active":"active", "href":rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-")], "Bearbeiten")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSBlogsUpdateView"));