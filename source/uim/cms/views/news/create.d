module uim.cms.views.news.create;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSNewsCreateView"));

  override void initialize() {
    super.initialize;
    
    this.rootPath("/cms/news");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/cms"], "CMS")
        .link(["href":this.rootPath], "Newss")
        .item(["active"], ["href":this.rootPath~"/create", "aria-current":"page"], "Create")
    );

    if(auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(bc)
        .title(titleCreate("News erstellen"))
        .rootPath(this.rootPath);
    }
    
    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Neuer News")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsCreateView~"::DCMSNewsCreateView:beforeH5");
    super.beforeH5(options);

    options["rootPath"] = this.rootPath;

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["cms_news"].createFromTemplate);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSNewsCreateView"));
