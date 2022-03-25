module uim.cms.scripts.demos.delete_;

@safe:
import uim.cms;
import uim.cms.scripts.demos;

auto deleteEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entity_theme"])~
    jsDeleteEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/delete.js", "w"); // open for writing
  f.write(deleteEntity);
}
