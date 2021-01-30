import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  
  static targets = [ "quantity", "sku", "cartButton" ]

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
      let cart_details = new FormData();
      cart_details.append("product_id", product_id);
      cart_details.append("product_quantity", product_quantity);
      cart_details.append("product_skus", product_skus);

      // check value of form to send
      // console.log("product_skus:", product_id);
      // console.log("product_quantity:", product_quantity);
      // console.log("product_skus:", product_skus);
      // for (let value of data) {
      //     console.log(value);
      // }

    
      
      // let button be loading and disabled while sending data to api 
      let button =  this.cartButtonTarget;
      button.classList.add("is-loading");

      // validate the data prepared to send api
      if (product_id && product_skus && product_quantity){
          
          //API
          Rails.ajax({
              
            url: "/api/v1/cart",
            type: "POST",
            data: cart_details,
          
            success: (response) =>{
                
                console.log(response);    
            }, 

            error: (err) =>{

              console.log(err);
            },

            complete: () => {
                button.classList.remove("is-loading");
            }

          })

      }
      
  }

}