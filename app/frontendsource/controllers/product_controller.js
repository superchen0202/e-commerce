import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  
  static targets = [ "quantity", "sku" ]

//   connect() {
//     console.log("I see a big girl");
//   }

  
  add_quantity(event){
   
    event.preventDefault();

    let quantity = Number(this.quantityTarget.value);
    this.quantityTarget.value = quantity + 1;
    
   // console.log(this.quantityTarget.value);
  }


  minus_quantity(event){
   
    event.preventDefault();

    let quantity = Number(this.quantityTarget.value);
    
    if(quantity > 1){

        this.quantityTarget.value = quantity - 1;
        //console.log(this.quantityTarget.value);
    
    }
    
   }

   add_to_cart(event){

    event.preventDefault();

    //catch product items details
    let product_id = document.querySelector("div[data-product-id]").dataset["productId"];
    let product_quantity = this.quantityTarget.value;
    let product_skus = this.skuTarget.value;

    //packing data to send to backend API
    let data = new FormData();
    data.append("product_id", product_id);
    data.append("product_quantity", product_quantity);
    data.append("product_skus", product_skus);

    // for (let value of data) {
    //     console.log(value);
    //  }
    

    //API
    Rails.ajax({
        
        url: "/api/v1/cart",
        type: "POST",
        data: data,
        success: (response) =>{
            console.log(response);
        }, 

        error: (err) =>{
            console.log(err);
        },

    })

 
   }


}