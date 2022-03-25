module uim.cms.views.blogs.read;

@safe:
import uim.cms;
import uim.cms.views.blogs;

class DCMSBlogsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSBlogsReadView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/blogs");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":rootPath], "Blogs")
      .link(["href":rootPath], "Anzeigen")
    );

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(rootPath)
          .title(titleView("Blog anzeigen"))
          .actions([["refresh", "list", "create"]])
      );

    if (auto frm = cast(DForm)this.form) {
      frm
        .crudMode(this.crudMode)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .mainTitle("Blogs")
          .subTitle("Blogs anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsReadView~"::DCMSBlogsReadView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle);
      // .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSBlogsReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}