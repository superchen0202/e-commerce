import { Controller } from "stimulus"
import Rails from "@rails/ujs"




export default class extends Controller {
  
  static targets = [ "count" ]

    // connect() {
    //   console.log("I see a big girl");
    // }

    updateCart(event){

        let data = event.detail;
        this.countTarget.innerText = `(${data.item_count})`;

    }

}