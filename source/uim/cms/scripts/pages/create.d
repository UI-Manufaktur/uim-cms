module uim.cms.scripts.pages.create;

@safe:
import uim.cms;
import uim.cms.scripts.pages;

auto createEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entity_theme"])~
    "setThemes();"~
    jsCreateEntity();

}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/create.js", "w"); // open for writing
  f.write(createEntity);
}
