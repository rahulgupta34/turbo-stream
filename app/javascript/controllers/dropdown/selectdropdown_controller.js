import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="dropdown--selectdropdown"
export default class extends Controller {

  static targets = ["country","city"]

  static values = {
    url: String
  }

  connect() {
    // console.log();
  }

  country(event){
    this.countryRequest(event)
  }

  countryRequest(event){
    let params = new URLSearchParams()
    params.append("country",event.target.value)
    get(`${this.urlValue}?${params}`,{
      responseKind: "turbo-stream"
    })
  }

  city(event){
    this.cityRequest(event)
  }

  cityRequest(event){
    get(`${this.cityTarget.dataset.cityurl}`,{
      query:{
        state: event.target.value,
        country: this.countryTarget.value
      },
      responseKind: "turbo-stream"
    })
  }

}
