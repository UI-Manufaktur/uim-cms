module uim.cms.scripts.tutorials.view;

@safe:
import uim.cms;
import uim.cms.scripts.tutorials;

public:
auto viewEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entityForm", "entity_tutorial"])~
    jsViewEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/view.js", "w"); // open for writing
  f.write(viewEntity);
}
