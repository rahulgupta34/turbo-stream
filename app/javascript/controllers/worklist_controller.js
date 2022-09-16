import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="worklist"
export default class extends Controller {
  
  static targets = ["cardHomeHeading","cardShoppingHeading","cardOfficeHeading", "textField","cardRadios","cardTitle","cardHomeList","cardShoppingList","cardOfficeList","ulLists", "textArea","homeDeleteButton","shoppingDeleteButton","officeDeleteButton"]

  connect() {
    // console.log("Connected...");
  }

  changeCardTitle(event){
    if(event.target.value == "change_card_title"){
      this.cardHeadingChange()
    }else{
      this.cardRadiosTargets.forEach((item) =>{
        if(item.checked){
          item.checked = false
          this.textFieldTarget.value = ""
        }
      })
    }

    if(event.target.value == "delete_work"){
      this.cardHeadingChange()
    }else{
      this.textAreaTarget.hidden = false
    }
    
  }

  addWork(){
    this.cardTitleTargets.forEach((item) => {
      if(item.checked && item.value == "add_work"){
        this.cardRadiosTargets.forEach((item) => {
          if(item.checked){
            if(item.value == "home"){
              if(this.textFieldTarget.value != ""){
                this.cardHomeListTarget.innerHTML = this.cardHomeListTarget.innerHTML + "<li data-worklist-target='ulLists'><button data-worklist-target='homeDeleteButton' class='deleteBtn' data-action='click->worklist#deleteList'>X</button> "+ this.textFieldTarget.value +"</>"
              this.textFieldTarget.value = ""
              }
            }else if(item.value == "shopping"){
              if(this.textFieldTarget.value != ""){
                this.cardShoppingListTarget.innerHTML = this.cardShoppingListTarget.innerHTML + "<li data-worklist-target='ulLists'> <button class='deleteBtn' data-worklist-target='shoppingDeleteButton' data-action='click->worklist#deleteList'>X</button> "+ this.textFieldTarget.value +"</>"
              this.textFieldTarget.value = ""
              }
            }else{
              if(this.textFieldTarget.value  != ""){
                this.cardOfficeListTarget.innerHTML = this.cardOfficeListTarget.innerHTML + "<li data-worklist-target='ulLists'> <button class='deleteBtn' data-worklist-target='officeDeleteButton' data-action='click->worklist#deleteList'>X</button> "+ this.textFieldTarget.value +"</>"
              this.textFieldTarget.value = ""
              }
            }
          }
        })
      }
    })
    
  }

  addWorkUsingSubmit(){
    this.addWork()
  }

  cardHeadingChange(){
    this.cardTitleTargets.forEach((item) => {
      if(item.checked){
           if(item.value == "change_card_title"){
            let radios = this.cardRadiosTargets
            radios.forEach((item) => {
              if(item.checked){
                if(item.value == "home"){
                  this.textFieldTarget.value = this.cardHomeHeadingTarget.innerText
                }else if(item.value == "shopping"){
                  this.textFieldTarget.value = this.cardShoppingHeadingTarget.innerText
                }else{
                  this.textFieldTarget.value = this.cardOfficeHeadingTarget.innerText
                }
              }
            })
           }else if(item.value == "delete_work"){
             this.textAreaTarget.hidden = true
             this.cardRadiosTargets.forEach((item) => {
               if(item.checked){
                if(item.value == "home"){
                  this.homeDeleteButtonTargets.forEach((item) => {
                    item.style.display ="inline-block"
                  })
                }else if(item.value == "shopping"){
                  this.shoppingDeleteButtonTargets.forEach((item) =>{
                  item.style.display ="inline-block"
                  })
                }else{
                  this.officeDeleteButtonTargets.forEach((item) => {
                    item.style.display ="inline-block"
                  })
                }
               }
             })
           }
      }
    }) 
  }

  addWorkButton(){
    this.cardTitleTargets.forEach((item) => {
      if(item.checked && item.value == "change_card_title"){
        this.cardRadiosTargets.forEach((item) => {
          if(item.checked){
            if(item.value == "home"){
              this.cardHomeHeadingTarget.innerText = this.textFieldTarget.value
              this.textFieldTarget.value = ""
            }else if(item.value == "shopping"){
              this.cardShoppingHeadingTarget.innerText = this.textFieldTarget.value
              this.textFieldTarget.value = ""
            }else{
              this.cardOfficeHeadingTarget.innerText = this.textFieldTarget.value
              this.textFieldTarget.value = ""
            }
          }
        })
      }
    })
  }

  clearWorkList(){
    this.ulListsTargets.forEach((item) => {
      item.remove()
    })
  }

  deleteList(event){
    event.target.closest("li").remove()
  }

}




