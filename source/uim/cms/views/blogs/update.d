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

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":rootPath], "Blogs")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(bc)
        .rootPath(rootPath)
        .title(titleEdit("Blog bearbeiten"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/blogs/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(rootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(rootPath)
          .mainTitle("Blogs")
          .subTitle("Blogs anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsUpdateView~"::DCMSBlogsUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

/*     if (auto frm = cast(DForm)this.form) {
      frm
        .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("CMSBlogsUpdateView"));