import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-complete"
export default class extends Controller {
  static targets = ["submitBtn"]
  connect() {
    console.log("Connected...");
    this.submitBtnTarget.hidden = true
  }

  submit(){
    this.submitBtnTarget.click()
  }

}
