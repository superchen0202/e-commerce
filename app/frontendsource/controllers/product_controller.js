import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  
  static targets = [ "quantity", "sku", "cartButton", "spec" ]

  // connect() {
  //   console.log("I see a big girl");
  // }
  
  add_quantity(event){
   
    event.preventDefault();

    let maxQuantity = Number(document.querySelector("div[data-product-target]").innerText);
    let quantity = Number(this.quantityTarget.value);

    if(quantity < maxQuantity){
      this.quantityTarget.value = quantity + 1;
    }
    else{
      alert("已無庫存!");
      this.quantityTarget.value = maxQuantity;
    }

   // console.log(this.quantityTarget.value);
  }

  minus_quantity(event){
   
    event.preventDefault();
   
    let maxQuantity = Number(document.querySelector("div[data-product-target]").innerText);
    let quantity = Number(this.quantityTarget.value);
    
    if(quantity > 1){
      this.quantityTarget.value = quantity - 1;
      //console.log(this.quantityTarget.value);
    }
    else{
      alert("選購數量不得低於1!")
      this.quantityTarget.value = 1;
    }
  
   }

  add_to_cart(event){

      event.preventDefault();
      
      //get skus quantity, and user's quantity to check beefore sending data to API.
      let maxQuantity = Number(document.querySelector("div[data-product-target]").innerText);
      let quantity = Number(this.quantityTarget.value);

      if(quantity > maxQuantity){
        alert("已無庫存!");
        this.quantityTarget.value = maxQuantity;
      }

      if(quantity <= 0){
        alert("選購數量不得低於1!");
        this.quantityTarget.value = 1;
      }

      if(quantity > 0 && quantity <= maxQuantity){
   
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
        // for (let value of cart_details) {
        //     console.log(value);
        // }      

        // let button be loading and disabled while sending data to api 
        let button =  this.cartButtonTarget;
        button.classList.add("is-loading");

        // validate the data prepared to send api
        if (product_id && product_skus && product_quantity ){
            
          //API
          Rails.ajax({
              
            url: "/api/v1/cart",
            type: "POST",
            data: cart_details,
          
            success: (response) =>{
              
              //console.log(response);

              if(response.status === "OK"){

                //change the numner of quantity while product add into carts
                let output = response.sku_left;
                this.specTarget.innerText = output;
                this.quantityTarget.value = 1;

                //capture the data API responded 
                console.log(response.items);
                let item_count = response.items || 0;
                alert("已加入到購物車!");
                
                //Cutomized the JS event, broadcast the event to controller of cart icon, update the item count of cart iconsynchronously
                let evt = new CustomEvent("addToCart", {"detail": {item_count } });
                document.dispatchEvent(evt);
              }

            }, 

            error: (err) =>{
              alert("產品數量不夠")
              console.log(err);
            },

            complete: () => {
                button.classList.remove("is-loading");
            }
          })

        }
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
          this.quantityTarget.value = 1;
        }
        
      },
      
      error: (err) => {
        console.log(err);
      }


    })



  
  }

}