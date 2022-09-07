import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["showBtn","hideBtn","links","para","txt"]
  static values = { id: Number,url: String }
  connect() {
    this.hideBtnTarget.hidden = true
    console.log(this.urlValue);
  }

  show(){
    this.hideBtnTarget.hidden = false
    this.showBtnTarget.hidden = true
  }

  hide(){
    this.showBtnTarget.hidden = false
    this.hideBtnTarget.hidden = true
  }

  toggleBtn(){
      if(this.paraTarget.hidden == true){
        this.paraTarget.hidden = false
      }else{
        this.paraTarget.hidden = true
      }
  }

  activeLink(e){
    e.preventDefault()
    this.linksTargets.forEach(item => {
      item.classList.remove("btn-primary")
    });
    e.target.classList.toggle("btn-primary")
  }

  copy(){
    let txt = this.txtTarget
    txt.select()
    document.execCommand("copy")
    txt.value = ""
  }

}
