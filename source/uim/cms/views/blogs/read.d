module uim.cms.views.blogs.read;

@safe:
import uim.cms;
import uim.cms.views.blogs;

class DCMSBlogsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("CMSBlogsReadView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/blogs");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleView("Blog anzeigen"))
        .actions([["refresh", "list", "create"]])
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Blogs")
            .item(["active", "fw-bold"], "Anzeigen")
          )          
        )
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(this.crudMode)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Blogs")
          .subTitle("Blogs anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsReadView~"::DCMSBlogsReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("CMSBlogsReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}