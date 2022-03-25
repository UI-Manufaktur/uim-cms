module uim.cms.views.indexwithsite;

@safe:
import uim.cms;

class DCMSIndexWithSiteView : DAPPView {
  mixin(APPViewThis!("CMSIndexWithSiteView"));

  mixin(OProperty!("DOOPEntity", "site"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSIndexWithSiteView~"DCMSIndexWithSiteView::toH5");
    super.toH5(options);
    // debug writeln("uim.cms.pages.index:serverCms.index:toH5 -> reqParameters = ", options);
    // debug writeln("uim.cms.pages.index:serverCms.index:toH5 -> pageTitle = ", options.get("pageTitle", ""));

    return 
      [H5Div(["content"],
        H5Div(["container-xl"], 
          BS5Row("messages", [""]),
          BS5Row(["row-deck row-cards"], site.id.toString)))].toH5;
    }
  }
mixin(APPViewCalls!("CMSIndexWithSiteView"));
