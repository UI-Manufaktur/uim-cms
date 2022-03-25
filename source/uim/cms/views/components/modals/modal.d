module uim.cms.views.components.modals.modal;

@safe:
import uim.cms;

class DACModal : DViewComponent {
  this() {}
  
  protected auto _modalContent = BS5ModalContent;

  override DH5Obj[] toH5(STRINGAA options = null) {
    auto id = entity ? entity.id.toString : UUID().toString;
    
    options["scripts"] ~= 
      jsLet("modal_"~id, "document.getElementById('modal_"~id~"')")~
      jsLet("modal_dialog_"~id, "document.getElementById('modal_dialog_"~id~"')");

    return       
      [BS5Modal("modal_"~id, ["modal-blur fade"], ["tabindex":"-1", "style":"display: none;", "aria-hidden":"true"],
        BS5ModalDialog("modal_dialog_"~id, ["modal-dialog-centered"], 
          _modalContent
        ))].toH5;
  }
}