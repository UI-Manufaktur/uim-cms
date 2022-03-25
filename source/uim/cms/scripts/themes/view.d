module uim.cms.scripts.themes.view;

@safe:
import uim.cms;
import uim.cms.scripts.themes;

public:
auto viewEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entityForm", "entity_theme"])~
    jsViewEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/view.js", "w"); // open for writing
  f.write(viewEntity);
}
