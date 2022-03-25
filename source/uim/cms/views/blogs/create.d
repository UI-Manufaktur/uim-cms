module uim.cms.views.blogs.create;

@safe:
import uim.cms;
import uim.cms.views.blogs;

class DCMSBlogsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSBlogsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":"/cms/blogs"], "Blogs")
      .link(["href":"/cms/blogs/create", "active":"active"], "Create")
    );

    if(auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleCreate("Blog erstellen"));
    }
    
    if (auto form = cast(DForm)this.form) {
      form
      .action(myRootPath~"/actions/create")
      .rootPath(myRootPath);

      if (auto frmHeader = cast(DFormHeader)form.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Neuer Blog")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }

      form
        .content(
          CMSPostFormContent
            .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsCreateView~"::DCMSBlogsCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["blogs"].createFromTemplate);
    }

    if (auto form = cast(DForm)this.components["form"]) {
      form
        .action("/cms/blogs/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSBlogsCreateView"));
