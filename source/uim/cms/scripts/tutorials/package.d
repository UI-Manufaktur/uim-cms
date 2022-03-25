module uim.cms.scripts.tutorials;

@safe:
import uim.cms;

auto myApi = "/api/v1/cms/tutorials";
auto myUrl = "/cms/tutorials";

public:
auto entity() {  
  string result;

  result ~= jsClass("Tutorial", [
    jsMethod("constructor", ["data"], "")
  ]);

  result ~= "async function fetchTutorials(sessionId) {
  try {
    let response = await fetch(\"/api/v1/cms/tutorials\", {
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
async function setTutorials(sessionId, selectedId) {
  "~jsElementById(["entity_tutorial"])~"
  let tutorials = await fetchTutorials(sessionId);
  let options = '';
  for (let i = 0; i < tutorials.length; i++) {
    if (tutorials[i].id === selectedId) options += `<option value=\"${tutorials[i].id}\" selected>${tutorials[i].display}</option>`;
    else options += `<option value=\"${tutorials[i].id}\">${tutorials[i].display}</option>`;
  }
  entity_tutorial.innerHTML=options;
}";

  return result;
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/entity.js", "w"); // open for writing
  f.write(entity);
}
