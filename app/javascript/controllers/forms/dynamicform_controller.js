import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="forms--dynamicform"
export default class extends Controller {

  static targets = ["other","total_typed"]
  static values = { show: String }
  static classes = ["color"]
  connect() {
    // console.log(this.colorClasses);
    this.otherTarget.hidden = true
  }

  selectHobby(e){
    setInterval(() => {
      this.toggle(e)
    }, 500)
  }

  toggle(e){
    if(e.target.value == this.showValue){
      this.otherTarget.hidden = false
    }else{
      this.otherTarget.hidden = true
    }
  }

  writeSomething(e){
      setTimeout(()=>{
        this.typedCharacter(e)
      },500)
  }

  typedCharacter(e){
    if(e.target.value.length > 0){
      this.total_typedTarget.innerHTML = "Total " + e.target.value.length + "Typed."
      this.total_typedTarget.classList.add(this.colorClasses[0])
      }else{
      this.total_typedTarget.innerHTML = "Total " + e.target.value.length + "Typed."
      this.total_typedTarget.classList.add(this.colorClasses[1])
      }
  }

}
