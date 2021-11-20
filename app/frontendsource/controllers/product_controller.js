import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  
  static targets = [ "quantity", "sku", "cartButton", "spec" ]

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
      // for (let value of cart_details) {
      //     console.log(value);
      // }
 
      // console.log(cart_details);
     
  
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

              if(response.status === "OK"){

                //capture the data API responded 
                let item_count = response.items || 0;
                
                //Cutomized the JS event, broadcast the event to controller of cart icon, update the item count of cart iconsynchronously
                let evt = new CustomEvent("addToCart", {"detail": {item_count } });
                document.dispatchEvent(evt);

              }

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


  select_spec(event){

    event.preventDefault();

    let select = document.querySelector('select')
    let spec = select.options[select.selectedIndex];
    //console.log(spec.value); //id

    

    let selectedOption = new FormData();
    selectedOption.append("sku_id", spec.value);

    Rails.ajax({

      url: "/api/v1/spec_sync",
      type: "POST",
      data: selectedOption,
    
      success: (response) =>{
        
        if(response.status === "OK"){

          let output = response.quantity;
          this.specTarget.innerText = output;
        }
        
      },
      
      error: (err) => {
        console.log(err);
      }


    })



  
  }



}