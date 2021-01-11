import { Controller } from "stimulus"
import Rails from "@rails/ujs"


export default class extends Controller {

    static targets = [ "email" ];


    add(event) {

        event.preventDefault();

        let email = this.emailTarget.value.trim();
        let formdata = new FormData();
        formdata.append("subscribe[email]", email)

        //console.log(formdata);

        Rails.ajax({
            
            url:'/api/v1/subscribe',
            type: 'POST',
            dataType: 'json',
            data: formdata,


            success: function(resoponse){
                console.log(resoponse);
            }

        });


    }
    
}