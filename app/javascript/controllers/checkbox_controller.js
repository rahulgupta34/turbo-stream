import { Controller } from "@hotwired/stimulus"
import { destroy } from '@rails/request.js'

// Connects to data-controller="checkbox"
export default class extends Controller {

  static targets = ["selectAll","categoryCheckbox"]

  static values = {
    url: String
  }

  connect() {
    this.selectAllTarget.checked = false
    this.categoryCheckboxTargets.forEach(element => {
      element.checked = false
    })
  }

  checkboxHandle(event){
    event.preventDefault()
    let arr = []
    this.categoryCheckboxTargets.forEach((element) => {
      if(element.checked){
        arr.push(element.value)
      }
    })
    destroy(this.urlValue,{
      responseKind: "turbo-stream",
      body: { 
        chk_values: arr
      }
    })
  }

  selectAll(){
    if(this.selectAllTarget.checked == true){
      this.categoryCheckboxTargets.forEach(element => {
        element.checked = true
      })
    }else{
      this.categoryCheckboxTargets.forEach(element => {
        element.checked = false
      })
    }
  }

}
