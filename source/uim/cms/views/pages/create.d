module uim.cms.views.pages.create;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSPagesCreateView"));

  override void initialize() {
    super.initialize;
    
    this.rootPath("/cms/pages");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/cms"], "CMS")
        .link(["href":this.rootPath], "Pages")
        .item(["active"], ["href":this.rootPath~"/create", "aria-current":"page"], "Create")
    );

    if(auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(bc)
        .title(titleCreate("Page erstellen"))
        .rootPath(this.rootPath);
    }
    
    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Neuer Page")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesCreateView~"::DCMSPagesCreateView:beforeH5");
    super.beforeH5(options);

    options["rootPath"] = this.rootPath;

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["cms_pages"].createFromTemplate);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSPagesCreateView"));
