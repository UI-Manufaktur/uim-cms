module uim.cms.scripts.blogs.create;

@safe:
import uim.cms;
import uim.cms.scripts.blogs;

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
