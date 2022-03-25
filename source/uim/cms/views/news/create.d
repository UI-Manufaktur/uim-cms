module uim.cms.views.news.create;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSNewsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "News")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        // .rootPath(myRootPath)
        .title(titleCreate("News erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/create")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent
          .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
    
      if (auto header = cast(DPageHeader)this.header) {
        header
          .rootPath(myRootPath)
          .mainTitle("Neuer News")
          .subTitle("Bitte Werte eingeben");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsCreateView~"::DCMSNewsCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "News ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "News Name:";
 */

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["news"].createFromTemplate);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/create")
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSNewsCreateView"));
