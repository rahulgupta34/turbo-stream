import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addshop"
export default class extends Controller {
  static targets = ["shopfield", "removeField"]
  
  connect() {
    
  }

  add_form(event){
    event.preventDefault()
    this.shopfieldTarget.id = parseInt(this.shopfieldTarget.id) + 1
    let field_add = `
    <div data-addshop-target="removeField">
      <label>Shop Name</label>
      <input type="text" name="customer[shops_attributes][${this.shopfieldTarget.id}][name]"/>
      <a href="#" data-action="click->addshop#remove">Remove</a>
    </div>
    `
    this.shopfieldTarget.innerHTML = this.shopfieldTarget.innerHTML + field_add
  }

  remove(event){
    event.preventDefault()
    console.log(event.target);
    this.removeFieldTarget.remove()
    this.shopfieldTarget.id = parseInt(this.shopfieldTarget.id) - 1
  }
}
