module uim.cms.scripts.blogs;

@safe:
import uim.cms;

auto myApi = "/api/v1/cms/blogs";
auto myUrl = "/cms/blogs";

public:
auto entity() {  
  string result;

  result ~= jsClass("Blog", [
    jsMethod("constructor", ["data"], "")
  ]);

  result ~= "async function fetchThemes(sessionId) {
  try {
    let response = await fetch(\"/api/v1/cms/themes\", {
      method: \"POST\",
      body: JSON.stringify({ sessionId: sessionId }),
      headers: { \"Content-Type\": \"application/json\" },
    });
    let data = await response.json();
    return data.entities;
  } catch (error) {
    console.log(error);
  }
}
async function setThemes(sessionId, selectedId) {
  "~jsElementById(["entity_theme"])~"
  let themes = await fetchThemes(sessionId);
  let options = '';
  for (let i = 0; i < themes.length; i++) {
    if (themes[i].id === selectedId) options += `<option value=\"${themes[i].id}\" selected>${themes[i].display}</option>`;
    else options += `<option value=\"${themes[i].id}\">${themes[i].display}</option>`;
  }
  entity_theme.innerHTML=options;
}";

  return result;
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/entity.js", "w"); // open for writing
  f.write(entity);
}
