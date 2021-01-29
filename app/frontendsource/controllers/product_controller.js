import { Controller } from "stimulus"

export default class extends Controller {
  
  static targets = [ "quantity", ]

  connect() {
    console.log("I see a big girl");
  }

  
  add_quantity(event){
   
    event.preventDefault();

    let quantity = Number(this.quantityTarget.value);
    this.quantityTarget.value = quantity + 1;
    
    console.log(this.quantityTarget.value);
  }


  minus_quantity(event){
   
    event.preventDefault();

    let quantity = Number(this.quantityTarget.value);
    
    if(quantity > 1){

        this.quantityTarget.value = quantity - 1;
        console.log(this.quantityTarget.value);
    
    }
    
   }
  
}