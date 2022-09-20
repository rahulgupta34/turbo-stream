import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {

  static targets = ["showBtn","modalDismiss","nameField"]

  connect() {
    this.showBtnTarget.hidden = true
    this.showBtnTarget.click()
  }

  submitForm(){
    if(this.nameFieldTarget.value != ""){
      setInterval(() =>{
        this.modalDismissTarget.click()
      },500)
    }
  }

}
