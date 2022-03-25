module uim.cms.layouts.layout;

@safe:
import uim.cms;

class DCMSLayout : DAPPLayout {
  this() { super(); }

  override void initialize() {
    debug writeln("initialize 'DCMSLayout");
    super.initialize();
    
    _bodyAttributes["style"] = "background-color: #ffffff;";

    this
    .title("UIM!CMS")   
    .parameters([
      "appLogo":"/img/servers/cms/logo.png",
      "appTitle":"UIM!CMS"
      ]);

    debug writeln("add metas");
    this.metas.add( 
      ["charset":"utf-8"],
      ["http-equiv":"X-UA-Compatible", "content":"IE=edge"],
      ["name":"viewport", "content":"width=device-width, initial-scale=1"], 
      ["http-equiv":"Content-Type", "content":"text/html; charset=utf-8"],
      );

    debug writeln("add links");
    this.links.add(
      ["rel":"icon", "type":"image/ico", "href":"/img/favicon.ico"],
      );

    debug writeln("add styles");
    this
      .styles.addLinks(
        "/css/apps/app.css"
    );
//        ["href":"/css/uim.css", "rel":"stylesheet"],       
/*         ["href":"/css/apps/main.css", "rel":"stylesheet"],        
      ["href":"/css/apps/cms/main.css", "rel":"stylesheet"]
*/  
      _bodyAttributes["style"] = "background-color: #ffffff;";
      _bodyClasses = ["d-flex", "flex-column", "h-100"];  

    debug writeln("Add navigation");
    if (this.navigation) if (auto secNavBar = cast(DAPPSecondNavbar)this.navigation.secondNavbar) {
      debug writeln("Adding leftslots");
      secNavBar.leftSlots([CMSNavSlot]);
    }
  }

  override void renderBody(DH5Html html, string[] classes, STRINGAA attributes, string content, STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLayout~"::DCMSLayout:renderBody");
    // super.renderBody(html, classes, attributes, content, options);
    
    auto nav = navigation ? navigation.render(options) : options.get("navigation", null);
    auto foot = footer ? footer.render(options) : options.get("footer", null);
    auto bodyContent = H5Div(["page"], ["style":"background-color:#ffffff;"], 
      nav~
      H5Div( 
        H5Main(["mt-3"], 
          content//~foot         
        )).toString
      ).toString;

    html
    .body_(classes)
		.body_(attributes)
		.body_(bodyContent); 
  }
}
auto CMSLayout() { return new DCMSLayout; }

/* auto navigation(STRINGAA options = null) {
  auto rootPath = options.get("rootPath", "/");

  return 
    APPFirstNavbar.toString(options)~
    APPSecondNavbar([CTLNavSlot]).brand(["link":"/", "title":"ADMIN!Central"]).toString(options);
}    

string footer(STRINGAA  options = null) {
  auto rootPath = options.get("rootPath", "/");

  return H5Footer(["pt-3 pb-3 fixed-bottom"], ["style":"background-color:#35A6FF"], 
    BS5Container.fluid()(
      H5P(["m-0 text-center text-white"], 
        `Version 1.0.1 - Copyright &copy; 2017-2021 UI Manufaktur UG (haftungsbeschränkt) - License UIM`)
    )).toString;
}
 */